// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {Level0} from "../src/Level0.sol";

contract Level0Solution is Script {
    Level0 public level0 = Level0(0x3d8aA479A2E9730dBB99ADb539f36B9335FFffae);

    function setUp() public {}

    function run() public {
        string memory password = level0.password();
        console.log("Password: ", password);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        level0.authenticate(password);

        vm.stopBroadcast();
      
    }
}
