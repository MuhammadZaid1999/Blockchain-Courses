// SPDX-License-Identifier: MIT

import {PriceConverter} from "./PriceConverter.sol";

pragma solidity ^0.8.18;

contract SkillTest {

    using PriceConverter for uint256;

    uint256 public MINIMUM_USD = 5e18;
    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable {
        
      // Here, `msg.value`, which is a `uint256` type, is extended to include the `getConversionRate()` function. 
      // The `msg.value` gets passed as the first argument to the function. 
      // If additional arguments are needed, they are passed in parentheses:
      // uint256 result = msg.value.getConversionRate(123);
      // In this case, `123` is passed as the second `uint256` argument to the function.
      require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
   
      // a function revert will undo any actions that have been done.
      // It will send the remaining gas back
      funders.push(msg.sender);
      addressToAmountFunded[msg.sender] += msg.value;

    }


    function withdraw() public {
      uint256 funderIndex;
      for (funderIndex = 0; funderIndex < funders.length; funderIndex++) {
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0; 

        // resetting array of funder method1
        // funders[funderIndex] = address(0);
      }

      // resetting array of funder method1
      funders = new address[](0);

      
      // Methods of Sending ETH through Contract 

      // `transfer` has a significant limitation. 
      // It can only use up to 2300 gas and it reverts any transaction that exceeds this gas limit
      // payable(msg.sender).transfer(address(this).balance); 

      // `send` also has a gas limit of 2300. If the gas limit is reached, it will not revert the transaction 
      // but return a boolean value (`true` or `false`) to indicate the success or failure of the transaction. 
      // trigger a "revert" condition if the `send` returns `false`.
      // bool success = payable(msg.sender).send(address(this).balance);
      // require(success, "Send failed");

      // The `call` function is flexible and powerful. It can be used to call any function without requiring its ABI. 
      // It does not have a gas limit, and like `send`, it returns a boolean value instead of reverting like `transfer`.
      // `call` is the recommended way of sending and receiving Ethereum or other blockchain native tokens.
      (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
      require(success, "Call failed");
    }

    // Function to send Ether to an address using call
    function callAmountTo(address payable _recipient, uint256 _amount) public returns (bool) {
        // Check if the contract has enough Ether to send
        require(address(this).balance >= _amount, "Insufficient balance in contract");

        // Use call to send Ether
        (bool success, ) = _recipient.call{value: _amount}("");

        // Handle the failure of the call
        require(success, "Transfer failed");

        // Return success status
        return success;
    }

}