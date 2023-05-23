
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import './b.sol'; // import './위치/파일명';
import './d/dd.sol'; // import './위치/파일명';

contract A {
    B_SmartContract b = new B_SmartContract();
    D_contract d = new D_contract();
    function add(uint _a, uint _b) public view returns(uint) {
        return b.add(_a, _b);
    }
      function mul(uint _a, uint _b) public view returns(uint) {
        return d.multiply(_a, _b);
    }
}