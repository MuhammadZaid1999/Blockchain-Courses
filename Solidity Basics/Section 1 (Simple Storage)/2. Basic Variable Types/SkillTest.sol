// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SkillTest {
    bool public type1;
    uint public type2;
    int256 public type3;
    string public type4;
    address public type5; // 0x0000000000000000000000000000000000000000
    bytes1 public type6; // 0x00
    bytes public type7;  // 0x
    bytes32 public type8; // 0x0000000000000000000000000000000000000000000000000000000000000000

    bool public type11 = true;
    uint public type12 = 88;
    int256 public type13 = -88;
    string public type14 = "eighty-eight";
    address public type15 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes1 public type16 = "Z"; // 0x5a
    bytes public type17 = "dynamic sized byte array of bytes dynamic sized byte array of 32 bytes dynamic sized byte array of 32 bytes"; // 0x64796e616d69632073697a65642062797465206172726179206f662062797465732064796e616d69632073697a65642062797465206172726179206f662033322062797465732064796e616d69632073697a65642062797465206172726179206f66203332206279746573
    bytes32 public type18 = "fix sized byte array of 32 byte"; // 0x6669782073697a65642062797465206172726179206f66203332206279746500
}