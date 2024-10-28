// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "SimpleStorage.sol"; 

contract Squared is SimpleStorage {

    function sayHello() public pure returns(string memory) {
        return "Hello";
    }

    function store(uint256 _newFavNumber) public override {
        myFavoriteNumber = _newFavNumber ** 2;
    }

}
