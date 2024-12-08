pragma solidity ^0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract SafeMathTester {
    using SafeMath for uint256;

    uint256 public bigNumber = 1e77;
    uint256 public bigNumber1 = 1e76;

    function add() public {
        bigNumber = bigNumber.add(1e77);
        // bigNumber += 1e77; decreasing numbers not 0
    }

    function sub() public {
        bigNumber1 = bigNumber1.sub(1e77);
        // bigNumber += 1e77; increasing numbers not 0
    }

}
