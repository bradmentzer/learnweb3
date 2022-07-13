// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// updates the value of num through the setNum function
contract Helper {
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}
