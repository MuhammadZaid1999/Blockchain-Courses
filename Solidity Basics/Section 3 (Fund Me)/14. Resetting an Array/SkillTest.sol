// SPDX-License-Identifier: MIT

import {PriceConverter} from "./PriceConverter.sol";

pragma solidity ^0.8.18;

contract SkillTest {

    using PriceConverter for uint256;

    uint256 public MINIMUM_USD = 5e18;
    address[] public funders = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0x617F2E2fD72FD9D5503197092aC168c91465E7f2];

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
    }

     // Method to reset the funders array using the iteration method
    function expensiveReset() public {
        // Iteratively pop each element from the array
          for(uint i=0; i<=funders.length; i++) {
            funders.pop(); 
            // delete funders[i]; only reset value cannot decrease array length
          }
    }

    function resetArray() public {
        // funders = new address[](0);
        // same as above line
        delete funders;  
    }

}