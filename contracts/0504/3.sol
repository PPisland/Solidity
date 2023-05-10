// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BYTES{
    bytes a;
    function setA(bytes memory _a) public{
        a= _a;
    }

    function setA2() public {
        a= "16";
    }

    function setA3(string memory _a) public{
        a = bytes(_a);
    }

    function getA() public view returns(bytes memory ) {
        return a; 
    }

}