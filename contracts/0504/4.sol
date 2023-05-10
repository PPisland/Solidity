// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract solution{

    function Square(uint _a) public pure returns(uint){

    return _a * _a;
    }   

    function power(uint a, uint b) public pure returns(uint)
    {
        return a**b;
    }

}