// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Test {
    function add(uint a, uint b, uint c, uint d) public pure returns(uint) {
        return a+b+c+d;
    }
    uint public A;

    function changA(uint _n) public {
        A = _n;
    }
}

contract Test2 {
    Test t1 ;


    constructor (address _a){
        t1 = Test(_a);
    }

    function ChangeExternal(uint _n) public {
        t1.changA(_n);
    }

}