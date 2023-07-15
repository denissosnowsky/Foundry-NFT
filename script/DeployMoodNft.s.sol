// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory happySvg = vm.readFile("./img/happy.svg");
        string memory sadSvg = vm.readFile("./img/sad.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageUri(happySvg),
            svgToImageUri(sadSvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(abi.encodePacked(svg));

        return string(abi.encodePacked(baseUrl, svgBase64Encoded));
    }
}
