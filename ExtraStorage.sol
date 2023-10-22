// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import contract
import "./SimpleStorage.sol";

// inherit all functionality from SimpleStorage contract
contract ExtraStorage is SimpleStorage {
    // override specifer overides the original method functionality in SimpleStorage contract
 function store(uint256 _favoriteNumber) public override {
    favoriteNumber = _favoriteNumber + 5;
 }
}
