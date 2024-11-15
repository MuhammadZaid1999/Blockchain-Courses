// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    function fund() public payable {
        
        require(msg.value > 1e18, "didn't send enough ETH");
        // a function revert will undo any actions that have been done.
        // It will send the remaining gas back
    }

    //function withdraw() public {}

    // Function to get the price of Ethereum in USD
    function getPrice() public {}
 
    // Function to convert a value based on the price
    function getConversionRate() public {}

    function getVersion() public view returns (uint256) {
      return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}


