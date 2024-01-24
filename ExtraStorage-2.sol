// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// This contract inherits all the functionality of SimpleStorage contract.
contract ExtraStorage is SimpleStorage {
    // overriding functions keyword: virtual and override
    // This allows you to change the function.
    function store(uint256 _favoriteNumber) public override  {
        favoriteNumber = _favoriteNumber + 5;
    }
}