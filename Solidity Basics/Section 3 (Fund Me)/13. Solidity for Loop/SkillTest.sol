// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SkillTest {

    uint8[] public numbers;

    // Function to populate the array with numbers 1 to 10
    function pushNumbers() public {
        // Clear the existing array before adding new values
        delete numbers;
        
        // Push values 1 to 10 into the numbers array
        for (uint8 i = 1; i <= 10; i++) {
            numbers.push(i);
        }
    }

}


