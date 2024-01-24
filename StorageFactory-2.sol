// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing a contract:
import "./SimpleStorage.sol"; // takes path, package or github.

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // The new keyword tells solidity to deploy contract.
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIdx, uint256 _simpleStorageNumber) public {
        // In order to interfact with contracts you need two things: address, ABI - Application Binary Interface
        // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIdx]);

        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIdx];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }

}