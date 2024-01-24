// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // ^0.8.8 means we are ok with a new version and >= 0.8.7 < 0.9.0 means we are ok with a range version.

// Always start with SPDX License and pragma solidity for versioning.
// Semi-colons tell solidity its the end of the line.

// Defining a contract: contract is a keyword and similar to a class in OOP languages.

contract SimpleStorage {
    // EVM: Ethereum Virtual Machine
    // Avalanche, Fantom, Polygon

    // basic types: bool, string, uint, int, address, bytes.
    // advanced type: struct (object)

    // This gets initalized to zero and by default is interal:
    // visibility specifiers: public, private, external, internal; view docs for more info.
    uint256 favoriteNumber;
    // People public person = People({ favoriteNumber: 2, name: "Kurtney"});

    // Creating a new type (object)
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // Creating a mapping: A mapping is like a dictionary
    mapping(string => uint256) public nameToFavoriteNumber;

    // Creating an array:
    // uint256[] public favoriteNums;
    People[] public people; // dynamic array because size not given.
    // People[3] public people; giving the array a fixed size

    // virtual keyword: allows function to be overidable.
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        // view and pure funcs calls cost gas when called from a gas costing func.
    }

    // view and pure functions, when called alone, don't spend gas; view means just reading.
    // You can't update the blockchain with a view function it just reads it 
    // view and pure functions disallow any modification of state.
    // pure functions disallowing reading.
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // calldata, memory, storage
    // memory:  temp variable that can get modified.
    // storage: perm variable that can get modified.
    // calldata: temp variable that doesn't get modiified.
    // struct, mappings, and arrays need to be given memory in func params.


    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({ favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber; // Using mapping
        // people.push(People(_favoriteNumber, _name)); another way of passing info.
    }
 
}