// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SkillTest {

    function tinyTip() public payable {
        // require(msg.value < 1e9); 
        // require(msg.value < 1 * 10 ** 9);
        require(msg.value < 1 gwei, "value should be less than 1 gwei");
    }

}
