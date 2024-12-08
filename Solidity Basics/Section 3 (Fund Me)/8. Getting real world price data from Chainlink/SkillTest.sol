// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);

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

    function getLatestBTCPriceInETH() public view returns (uint256) {
      (,int answer,,,) = priceFeed.latestRoundData();
      return uint(answer);
    }

    function getVersion() public view returns (uint256) {
      return priceFeed.version();
    }

}


