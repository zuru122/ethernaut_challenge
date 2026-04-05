// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "lib/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract Level2Fallout {
    using SafeMath for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    //@notice The constructor is misspelled, and it's a normal function that can be called by anyone so it is not executed when the contract is deployed. This means that the owner variable is not set, and anyone can call the allocate function and send a value to become the owner.
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        allocations[msg.sender] = allocations[msg.sender].add(msg.value);
    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0);
        allocator.transfer(allocations[allocator]);
    }

    function collectAllocations() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}