// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Libraries cant have state variables or send ether. Similar to a contract.
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
     // Solidity doesn't work well with decimals.
     // Since we are interfacting with a different contract outside we need: ABI, Address
     // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
     (, int256 price,,,) = priceFeed.latestRoundData();
     // Type casting: 
     return uint256(price * 1e10);
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        // Always Multiply before dividing in solidity
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}