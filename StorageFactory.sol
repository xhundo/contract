// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract import 
import "./SimpleStorage.sol";

contract StorageFactory {

    // SimpleStorage public simpleStorage;
    // SimpleStorage[] (type)
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
       // new keyword: means deploying contract returns contract object
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // in order to interact with the contact 
        // (address/ABI: Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIdx) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIdx].retrieve();
    }
} 

