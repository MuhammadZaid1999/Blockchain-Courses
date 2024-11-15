// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public MINIMUM_USD = 5e18;

    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

    function fund() public payable {
        
        require(getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        // a function revert will undo any actions that have been done.
        // It will send the remaining gas back
    }

    //function withdraw() public {}

    // Function to convert a value based on the price
    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
      uint256 ethPrice = getLatestPrice();
      uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
    
      return ethAmountInUsd;
    }

    // Function to get the price of Ethereum in USD
    function getLatestPrice() public view returns (uint256) {
      (,int answer,,,) = priceFeed.latestRoundData();
      return uint(answer) * 1e10;
    }

    function getVersion() public view returns (uint256) {
      return priceFeed.version();
    }

}


