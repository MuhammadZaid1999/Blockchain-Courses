// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SkillTest {
    
    string name = "zaid";

    function _storage(string calldata name1, string memory name2) public {
        // name1 = name2; error calldata canl't change
        name = name1;
        name = name2;
    }
}
