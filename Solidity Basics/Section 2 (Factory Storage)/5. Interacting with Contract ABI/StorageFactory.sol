// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimplestorageContract() public  {
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);    
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_simpleStorageNumber);

        // ---------- we can also use this -----------
        // SimpleStorage newSimpleStorageNumber = listOfSimpleStorageContracts[_simpleStorageIndex];
        // newSimpleStorageNumber.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();

        // ---------- we can also use this -----------
        // SimpleStorage newSimpleStorageNumber = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return newSimpleStorageNumber.retrieve();   
    }
}