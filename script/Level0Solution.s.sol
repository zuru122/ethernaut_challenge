// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {Level0} from "../src/Level0.sol";

contract Level0Solution is Script {
    Level0 public level0 = Level0(0x8A8bC05AEd3b530Ae239D9AC8F11FFa77434D60c);

    function setUp() public {}

    function run() public {
        string memory password = level0.password();
        console.log("Password: ", password);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        level0.authenticate(password);

        vm.stopBroadcast();
      
    }
}
