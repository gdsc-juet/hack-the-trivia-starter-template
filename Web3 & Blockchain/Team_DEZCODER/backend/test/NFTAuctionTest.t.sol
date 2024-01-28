//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test, console} from "../lib/forge-std/src/Test.sol";

import {DeployChangingNFT} from "../script/DeployChangingNFT.s.sol";
import {ChangingNFT} from "../src/ChangingNFT.sol";
import {NFTAuction} from "../src/Auction.sol";
import {DeployNFTAuction} from "../script/DeployNFTAuction.s.sol";

contract NFTAuctionTest is Test {
    ChangingNFT chgNFT;
    NFTAuction nFTAuc;
    address USER = makeAddr("user");
    address BIDDER1 = makeAddr("bidder1");
    DeployChangingNFT deployNFT;
    DeployNFTAuction deployauc;

    function setUp() public {
        deployNFT = new DeployChangingNFT();
        chgNFT = deployNFT.run();
        deployauc = new DeployNFTAuction();
        nFTAuc = deployauc.run();
    }

    function testmintNFT1() public {
        vm.prank(USER);
        chgNFT.mintNFT();
        string memory IMG1_SVG_TOKEN_URI ="data:application/json;base64,eyJuYW1lIjoiQ0hBTkdJTkcgTkZUIiwgImRlc2NyaXB0aW9uIjoiQW4gTkZUIHRoYXQgY2hhbmdlcyBhY2NvcmRpbmcgdG8gb3duZXJzIHdpbGwuIiwiYXR0cmlidXRlczpbeyJ0cmFpdF90eXBlIjoiYWJzdHJhY3Qgb2JqZWN0In1dLCJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU16QXdJaUJvWldsbmFIUTlJalF3TUNJZ2VHMXNibk05SW1oMGRIQTZMeTkzZDNjdWR6TXViM0puTHpJd01EQXZjM1puSWo0TkNpQWdQQ0V0TFNCU1pXTjBZVzVuZFd4aGNpQmpZWEprSUdKaFkydG5jbTkxYm1RZ0xTMCtEUW9nSUR4eVpXTjBJSGc5SWpJd0lpQjVQU0l5TUNJZ2QybGtkR2c5SWpJMk1DSWdhR1ZwWjJoMFBTSXpOakFpSUhKNFBTSXhNQ0lnY25rOUlqRXdJaUJtYVd4c1BTSWpaakptTW1ZeUlpQnpkSEp2YTJVOUltSnNkV1VpSUhOMGNtOXJaUzEzYVdSMGFEMGlNaUlnTHo0TkNnMEtJQ0E4SVMwdElGTmhiWEJzWlNCcGJXRm5aU0IxYzJsdVp5QmlZWE5sTmpRZ1pXNWpiMlJsWkNCVlVrd2dMUzArRFFvZ0lEeHBiV0ZuWlNCNFBTSTVNQ0lnZVQwaU5qQWlJSGRwWkhSb1BTSXhNakFpSUdobGFXZG9kRDBpTVRJd0lpQm9jbVZtUFNKb2RIUndjem92TDJsd1puTXVhVzh2YVhCbWN5OVJiV1ZZWlRWelZtbG1TSFEwYjBkM04yaE9ORTF5VmxOWFUzbDZRbkkxU21SdVYxSnJhMUY1TTFkUU1qSmlQMlpwYkdWdVlXMWxQWE54ZFdseWRHeGxMbkJ1WnlJdlBnMEtEUW9nSUR3aExTMGdWR1Y0ZENCc2FXNWxjeUF0TFQ0TkNpQWdQSFJsZUhRZ2VEMGlNVFV3SWlCNVBTSXlNakFpSUhSbGVIUXRZVzVqYUc5eVBTSnRhV1JrYkdVaUlHWnZiblF0Wm1GdGFXeDVQU0pCY21saGJDd2djMkZ1Y3kxelpYSnBaaUlnWm05dWRDMXphWHBsUFNJeE5DSWdabTl1ZEMxM1pXbG5hSFE5SWpZd01DSWdabWxzYkQwaUl6TXpNeUkrRFFvZ0lDQWdQSFJ6Y0dGdUlIZzlJakV5TUNJZ1pIazlJalVpSUdadmJuUXRjM1I1YkdVOUltbDBZV3hwWXlJZ1ptbHNiRDBpSXpZMk5pSStUbUZ0WlR3dmRITndZVzQrRFFvZ0lDQWdQSFJ6Y0dGdUlIZzlJakU0TUNJZ1pIazlJakFpUGxOeGRXbHlkR3hsUEM5MGMzQmhiajROQ2lBZ0lDQThkSE53WVc0Z2VEMGlNVEl3SWlCa2VUMGlNalVpSUdadmJuUXRjM1I1YkdVOUltbDBZV3hwWXlJZ1ptbHNiRDBpSXpZMk5pSStWSGx3WlR3dmRITndZVzQrRFFvZ0lDQWdQSFJ6Y0dGdUlIZzlJakU0TUNJZ1pIazlJakFpUGxkaGRHVnlQQzkwYzNCaGJqNE5DaUFnSUNBOGRITndZVzRnZUQwaU1USXdJaUJrZVQwaU1qVWlJR1p2Ym5RdGMzUjViR1U5SW1sMFlXeHBZeUlnWm1sc2JEMGlJelkyTmlJK1NGQThMM1J6Y0dGdVBnMEtJQ0FnSUR4MGMzQmhiaUI0UFNJeE9EQWlJR1I1UFNJd0lqNDBORHd2ZEhOd1lXNCtEUW9nSUNBZ1BIUnpjR0Z1SUhnOUlqRXlNQ0lnWkhrOUlqSTFJaUJtYjI1MExYTjBlV3hsUFNKcGRHRnNhV01pSUdacGJHdzlJaU0yTmpZaVBrRjBkR0ZqYXp3dmRITndZVzQrRFFvZ0lDQWdQSFJ6Y0dGdUlIZzlJakU0TUNJZ1pIazlJakFpUGpRNFBDOTBjM0JoYmo0TkNpQWdJQ0FOQ2lBZ1BDOTBaWGgwUGcwS1BDOXpkbWMrRFFvPSJ9";
        assertEq(chgNFT.tokenURI(0),IMG1_SVG_TOKEN_URI);
    }

    function testCreateAuction() public {
        address nftcontract = address(chgNFT);
        address aucContract = address(nFTAuc);
        uint256 price= 0.05 ether;
        uint256 tkId = 0;
        uint256 duration = 5;
        vm.prank(USER);
        chgNFT.mintNFT();
        vm.prank(USER);
        chgNFT.approveTransfer(aucContract,tkId);
        vm.prank(USER);
        nFTAuc.createAuction(nftcontract,tkId,price,duration);
        assertEq(chgNFT.getNftOwner(tkId),aucContract);
    }

    function testAuctionWorkflow() public {
    // Mint an NFT
    vm.prank(USER);
    chgNFT.mintNFT();
    // console.log("After mint NFT:",block.number);
    
    // Get NFT contract and auction contract addresses
    address nftContract = address(chgNFT);
    address auctionContract = address(nFTAuc);

    // Set up auction parameters
    uint256 startPrice = 0.05 ether;
    uint256 tokenId = 0;
    uint256 auctionDuration = 10;

    // Approve the auction contract to transfer the NFT
    vm.prank(USER);
    chgNFT.approveTransfer(auctionContract, tokenId);
    // console.log("After approve NFT: ",block.number);

    // Create an auction
    vm.prank(USER);
    nFTAuc.createAuction(nftContract, tokenId, startPrice, auctionDuration);
    uint256 auctionStartBlock = block.timestamp; // Get the start block

    // Place a bid on the auction
    uint256 bidAmount = startPrice + 0.01 ether;
    startHoax(BIDDER1, bidAmount);
    nFTAuc.placeBid(1, bidAmount);

    // Calculate the block number at the end of the auction
    uint256 auctionEndBlock = auctionStartBlock + auctionDuration;

    // Move blocks to simulate auction end
    vm.warp(auctionEndBlock);

    // End the auction
    nFTAuc.endAuction(1);

    // Get the auction result
    (, , , , , , , address winner, uint256 winningAmount) = nFTAuc.auctions(1);

    // Assert that the winner and winning amount are correct
    assertEq(winner, BIDDER1);
    assertEq(winningAmount, bidAmount);
}

}