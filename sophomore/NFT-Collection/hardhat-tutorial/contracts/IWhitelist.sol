// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// need to call mapping(address => bool) public whitelistedAddresses;
// create an interface for Whitelist contract with a function for mapping to save gas
interface IWhitelist {
    function whitelistedAddresses(address) external view returns (bool);
}
