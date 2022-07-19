//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// can be typecasted as helper.sol because it will generate the same ABI
// the code is different byt the ABI only contains dunction definition for public variables, functions, events
contract Attack {
    address owner;
    mapping(address => bool) userEligible;

    constructor() {
        owner = msg.sender;
    }

    function isUserEligible(address user) public view returns (bool) {
        if (user == owner) {
            return true;
        }
        return false;
    }

    function setUserEligible(address user) public {
        userEligible[user] = true;
    }

    fallback() external {}
}
