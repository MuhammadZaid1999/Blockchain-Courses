// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MathLibrary} from "./SkillTestLibrary.sol";

contract SkillTest {

    using MathLibrary for uint256;

    function calculateSum(uint256 a, uint256 b) public pure returns(uint256){
        return a.sum(b);
    }


}


