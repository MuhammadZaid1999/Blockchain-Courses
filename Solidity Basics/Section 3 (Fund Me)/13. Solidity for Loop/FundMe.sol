// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

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
      }
    }

}


