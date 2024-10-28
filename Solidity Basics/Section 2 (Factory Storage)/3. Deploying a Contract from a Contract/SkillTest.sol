// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Cows {}

contract Birds {}

contract AnimalFactory{
    Cows public cows;
    Birds public birds;

    function createAnimals() public  {
        cows = new Cows();
        birds = new Birds();    
    }
}