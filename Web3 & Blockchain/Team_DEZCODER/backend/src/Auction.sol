// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Counters.sol";

contract NFTAuction is IERC721Receiver {
    using Counters for Counters.Counter;

    Counters.Counter private auctionIdCounter;

    struct Auction {
        uint256 id;
        address nftContract;
        uint256 tokenId;
        address seller;
        uint256 startPrice;
        uint256 endBlock;
        bool active;
        address highestBidder;
        uint256 highestBid;
    }

    mapping(uint256 => Auction) public auctions;

    event AuctionCreated(
        uint256 auctionId, address indexed nftContract, uint256 indexed tokenId, address indexed seller
    );
    event NewBidPlaced(uint256 auctionId, address indexed bidder, uint256 amount);
    event AuctionEnded(uint256 auctionId, address indexed winner, uint256 amount);

    function createAuction(address _nftContract, uint256 _tokenId, uint256 _startPrice, uint256 _durationInBlocks)
        external
    {
        require(_durationInBlocks > 0, "Duration must be greater than zero");

        IERC721 nft = IERC721(_nftContract);
        require(msg.sender == nft.ownerOf(_tokenId), "Only the owner can create an auction");

        nft.transferFrom(msg.sender, address(this), _tokenId);

        auctionIdCounter.increment();
        uint256 auctionId = auctionIdCounter.current();

        auctions[auctionId] = Auction({
            id: auctionId,
            nftContract: _nftContract,
            tokenId: _tokenId,
            seller: msg.sender,
            startPrice: _startPrice,
            endBlock: block.timestamp + _durationInBlocks,
            active: true,
            highestBidder: address(0),
            highestBid: 0
        });

        emit AuctionCreated(auctionId, _nftContract, _tokenId, msg.sender);
    }

    function placeBid(uint256 _auctionId, uint256 _amount) external {
        Auction storage auction = auctions[_auctionId];
        require(auction.active, "Auction is not active");
        require(block.number < auction.endBlock, "Auction has ended");
        require(_amount > auction.highestBid, "Bid must be higher than current highest bid");

        if (auction.highestBidder != address(0)) {
            // Refund previous bidder
            IERC20(auction.nftContract).transfer(auction.highestBidder, auction.highestBid);
        }

        // Place the new bid
        auction.highestBidder = msg.sender;
        auction.highestBid = _amount;

        emit NewBidPlaced(_auctionId, msg.sender, _amount);
    }

    function endAuction(uint256 _auctionId) external {
        Auction storage auction = auctions[_auctionId];
        require(block.timestamp >= auction.endBlock, "Auction has not ended yet");
        require(auction.active, "Auction is not active");
        require(auction.highestBidder != address(0), "No bids placed");

        auction.active = false;

        IERC721 nft = IERC721(auction.nftContract);
        nft.safeTransferFrom(address(this), auction.highestBidder, auction.tokenId);

        emit AuctionEnded(_auctionId, auction.highestBidder, auction.highestBid);
    }

    function onERC721Received(address, address, uint256, bytes memory) external pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
