pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255;

    // check the overflow and underflow by default
    function add() public {
        bigNumber = bigNumber + 1;
    }

    
    // the addition operation with `unchecked` will ignore the overflow and underflow checks: 
    // if the `bigNumber` exceeds the limit, it will wrap its value to zero.
    function add1() public {
        unchecked {
            bigNumber = bigNumber + 1;
        }
    }

}
