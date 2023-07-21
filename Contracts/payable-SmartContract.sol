// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    // This function is payable, meaning it can receive Ether.
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balance += msg.value;
    }

    // This function allows the contract owner to withdraw the contract's balance.
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(balance > 0, "No balance to withdraw");

        uint amount = balance;
        balance = 0;
        payable(owner).transfer(amount);
    }

    // This function allows anyone to check the contract's balance.
    function getBalance() public view returns (uint) {
        return balance;
    }
}
