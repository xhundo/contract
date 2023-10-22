// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // (Solidity specific version you only want to use) always add at the top

//** Comments **/
// pragma solidity ^0.8.21; // (^0.8.21 tells solidity that we are okay with a more new version 0.8.21 and above)
// pragma solidity >=0.8.21; // (Solidity version within a range) always add at the top
// always add a license 
// adding a semicolon tells solidity thats it the end of the line

// keyword: contract tells solidity that we will define a contract
// basic types: boolean, uint, int, address, bytes, string
// int: positive or negative number
// bytes: number of storage to allocate to a uint or int (ex: int8 or uint256)
// address: wallet address
// bytes: bytes object (if you dont specify bytes then it can be any byte size.
// uint and int bytes max is 256 and lowest 8
// bytes obj max is 32
// uint: a postive number 

// contract SimpleStorage {
//     // declare a variable that is a boolean type
//     bool hasFavoriteNumber = true;
//     uint256 favoriteNumber = 9;
//     string favoriteWord = "Rich";
//     int256 favoriteInt = -90;
//     address myAddress = 0xAD9380c44d6d0ff3dA582211A758564E7AB574a1; 
//     bytes32 favoriteBytes = "cat"; //0x11342412
// }


contract SimpleStorage {

    // This gets initalized to zero. If you don't specify bytes it defaults to 256 (uint256 or int256)
    uint256  favoriteNumber;


    People public person = People({ favoriteNumber: 9, name: "Kurtney"});

    // an array of people objects: //dynamic array size
    People[] public people;

    // 5 means this array can only have a length of 5. Fixed-Array size.
    People[5] public persons;


    // maps a key to a value 
    mapping(string => uint256) public nameToFavoriteNumber;

    // object (struct) type
    struct People {
        uint256 favoriteNumber;
        string  name;
    }

    // adding virtual specifier means method can be overridden
    // _favoriteNumber (local var: naming convention)
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        retrieve();
    }

    // view/pure functions: (you can only read with view) ** no gas fee
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // an array, struct, or mapping is a special type in solidity.
    // string: an array of bytes. (memory // calldata)
    // we need to tell solidity, the data location of array, mapping, struct (calldata, memory)
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
    //   People memory newPerson = People(_favoriteNumber, _name);
      people.push(People(_favoriteNumber, _name));
      nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // 0xf8e81D47203A594245E36C48e151709F0C19fBe8 (deployed smart contract address) 
}