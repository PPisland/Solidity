// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// import "@openzeppelin/contracts/utils/Strings.sol";

contract D_contract {
    function multiply(uint _a, uint _b) public pure returns(uint) {
        return _a*_a*_b;
    }
}