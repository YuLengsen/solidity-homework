// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BeggingContract {
    event Donation(address indexed donor, uint256 amount);
    event Withdraw(address indexed  owner, uint256 amount);

    address public owner;

    mapping(address => uint256) public donations;

    constructor() {
        owner = msg.sender;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation must be greater than 0");
        donations[msg.sender] += msg.value;

        emit Donation(msg.sender, msg.value);
    }

    function getDonation(address donor) external view returns (uint256) {
        return donations[donor];
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function withdraw() external onlyOwner{
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        payable(owner).transfer(balance);
        emit Withdraw(owner, balance);
    }
}