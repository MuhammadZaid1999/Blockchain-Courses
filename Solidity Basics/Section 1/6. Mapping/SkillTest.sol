// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SkillTest {
    
    mapping (address => uint256) public addressToBalance;

    function addBalance(address _address, uint256 amount) public {
        addressToBalance[_address] += amount;
    }
}
