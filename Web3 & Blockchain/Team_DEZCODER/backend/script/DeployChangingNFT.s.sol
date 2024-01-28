//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {ChangingNFT} from "../src/ChangingNFT.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract DeployChangingNFT is Script {
    function run() external returns (ChangingNFT) {
        //goto foundry.toml and make ffi=false to access readfile
        string memory img01Svg = vm.readFile("./card/squirtle.svg");
        string memory img02Svg = vm.readFile("./card/wartortle.svg");

        // string memory img11Svg = vm.readFile("./card/squirtle.svg");
        // string memory img12Svg = vm.readFile("./card/blastoise.svg");
        // string[] memory img1Svgpack = new string[](2);
        // img1Svgpack[0] = svgToImageURI(img01Svg);
        // img1Svgpack[1] = svgToImageURI(img11Svg);
        
        // string[] memory img2Svgpack = new string[](2);
        // img2Svgpack[0] = svgToImageURI(img02Svg);
        // img2Svgpack[1] = svgToImageURI(img12Svg);

        vm.startBroadcast();
        // ChangingNFT changingNFT = new ChangingNFT(img1Svgpack,img2Svgpack);
        ChangingNFT changingNFT = new ChangingNFT(svgToImageURI(img01Svg),svgToImageURI(img02Svg));
        changingNFT.mintNFT();
        vm.stopBroadcast();
        return changingNFT;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";

        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
