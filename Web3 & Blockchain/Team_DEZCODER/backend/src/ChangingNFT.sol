//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract ChangingNFT is ERC721 {
    //error
    error ChangingNFT_CantChangeNFTIfNotOwner();

    uint256 private s_tokenCounter;
    uint256 private size = 2;
    string private s_img1Uri;
    string private s_img2Uri;

    enum ImgName {
        IMG1,
        IMG2
    }

    mapping(uint256 => ImgName) private s_tokenIdToImage;
    mapping(uint256 => address) private s_NftOwners;

    constructor(string memory img1Uri, string memory img2Uri) ERC721("CHANGING NFT", "CHGNFT") {
        s_tokenCounter = 0;
        s_img1Uri = img1Uri;
        s_img2Uri = img2Uri;
    }

    modifier _isApprovedOrOwner(address caller, uint256 tkid) {
    if (msg.sender != ownerOf(tkid) && getApproved(tkid) != caller) {
        revert ChangingNFT_CantChangeNFTIfNotOwner();
    }
    _;
}

    //Function to mint NFT

    function mintNFT() public {
        require(s_tokenCounter < size, "Maximum token Minted");
        _safeMint(msg.sender, s_tokenCounter);
        s_NftOwners[s_tokenCounter] = msg.sender;
        s_tokenIdToImage[s_tokenCounter] = ImgName.IMG1;
        s_tokenCounter++;
    }
    //Function to change NFT image

    function changeNFT(uint256 tokenId) public _isApprovedOrOwner(msg.sender, tokenId) {

        if (s_tokenIdToImage[tokenId] == ImgName.IMG1) {
            s_tokenIdToImage[tokenId] = ImgName.IMG2;
        } else {
            s_tokenIdToImage[tokenId] = ImgName.IMG1;
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI = s_img1Uri;

        if (s_tokenIdToImage[tokenId] == ImgName.IMG2) {
            imageURI = s_img2Uri;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(),
                            '", "description":"An NFT that changes according to owners will.","attributes:[{"trait_type":"abstract object"}],"image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function getImg1Uri() public view returns (string memory) {
        return s_img1Uri;
    }

    function getImg2Uri() public view returns (string memory) {
        return s_img2Uri;
    }

    function transferNFT(address to, uint256 tokenId) public _isApprovedOrOwner(msg.sender, tokenId) {
        require(to != address(0), "Invalid address");

        // Transfer the NFT to the new owner
        _transfer(msg.sender, to, tokenId);
        s_NftOwners[tokenId] = to;
    }

    function getNftOwner(uint256 tokenId) public view returns (address) {
        return s_NftOwners[tokenId];
    }
    // Function to approve an address for transferring a specific token

    function approveTransfer(address to, uint256 tokenId) external {
        require(msg.sender == getNftOwner(tokenId), "Only the token owner can approve transfer");
        approve(to, tokenId);
    }
}
