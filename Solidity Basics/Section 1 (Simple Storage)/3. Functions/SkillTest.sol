// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SkillTest {
    uint8 num1 = 5;

    function onlyPrivateAccessable() private view returns (uint8){
        return num1;
    }

    function onlyExternalAccessable() external pure returns (uint8){
        return 10;
    }

    function currentandChildAccessable() internal view returns (uint8){
        return num1;
    }
}