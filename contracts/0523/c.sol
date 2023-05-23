// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract C {
    

    function UtoS(uint _n) public pure returns(string memory){
        return Strings.toString(_n);
    }
}