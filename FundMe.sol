// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

import "./PriceConverter.sol";

contract FundMe {
    // Attaching library to uint256
    using PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    address public owner;

    // gets called right away when deployed
    constructor() {
        owner = msg.sender;
    }

    // Makes contract payable hence payable keyword. In-order to send native token or ethereum you have to make it payable.
    function fund() public payable {
        
        // Require is a checker: if msg.value isn't greater than it errors with msg.
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough"); // msg.value:  global variable To get how much someone is sending.
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        // = setting
        // == comparing 
        require(msg.sender == owner, "Sender is not owner!");

        // Looping in solidity
        /* starting idx, ending index, step amount */
        for (uint256 funderIdx = 0; funderIdx < funders.length; funderIdx++) {
           address funder =  funders[funderIdx];
           addressToAmountFunded[funder] = 0;
        } 
        // resseting the array with zero objects to start
        funders = new address[](0);

        // withdraw funds
        // if we wanted to transfer
        // msg.sender (type address)
        // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance); // sends error automatically

        // // send - 
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed"); // Will revert if error


        // call -
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    // Creating a modifer
    modifier onlyOwner {
           require(msg.sender == owner, "Sender is not owner!");
           _; // represents doing the rest of the code.
    }
}