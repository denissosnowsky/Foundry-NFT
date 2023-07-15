// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract MoodNftTest is Test {
    string private constant HAPPY_SVG_URI = "HAPPY_SVG_URI";
    string private constant SAD_SVG_URI = "SAD_SVG_URI";
    MoodNft private moodNft;
    address USER = makeAddr('user');

    function setUp() public {
        moodNft = new MoodNft(HAPPY_SVG_URI, SAD_SVG_URI);
    }

    function testViewTokenUri() public {
        vm.prank(USER);
        moodNft.mintNft();
    }
}
