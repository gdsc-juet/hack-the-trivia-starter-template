//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script,console} from '../lib/forge-std/src/Script.sol';
import {NFTAuction} from '../src/Auction.sol';

contract DeployNFTAuction is Script{
    function run() external returns (NFTAuction){
        vm.startBroadcast();
        NFTAuction nftAuction = new NFTAuction();
        vm.stopBroadcast();
        return nftAuction;
    }
}