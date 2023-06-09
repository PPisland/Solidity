// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract UintandString {
    uint a; // 숫자형 변수 a선언
    string b; // 문자형 변수 b선언

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setB(string memory _b) public {
        b = _b;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function setBasC() public{
        b = "c";
    }
    function setBasC2() public{
        b= "C";
    }

    function setBasABC() public{
        b = "abc";
    }

    function setAB(uint  _a,string memory _b) public {
        a= _a;
        b = _b;
    }

    function getAB() public view returns(uint ,string memory) {
        return (a,b);
    }
}