pragma solidity ^0.6.0;

contract SafeMathTester {
    uint8 public bigNumber = 255;

    //  If we call the `add` function, it will return `0` instead of the expected `256`.
    function add() public {
        bigNumber = bigNumber + 1;
    }

    // SafeMath:
    // `SafeMath.sol` provided a mechanism to revert transactions when the maximum limit of a `uint256` 
    // data type was reached. It was a typical security measure across contracts to avoid erroneous 
    // calculations and potential exploits.
    
    // function add(uint a, uint b) public pure returns (uint) {
    //     uint c = a + b;
    //     require(c >= a, "SafeMath: addition overflow");
    //     return c;
    // }

}
