// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract StringAndBytes {
    string a;

    function setSting(string memory _a) public {
        a = _a;
    }

    function getString() public view returns(string memory) {
        return  a;        
    }
        //특정 문자를 뽑아서 사용하고싶을 때? 사용
    function stringToBytes() public view returns(bytes memory){
        return bytes(a);
    }
    function stringToBytes2() public view returns(bytes1, bytes1, bytes1) {
        return (bytes(a)[0], bytes(a)[1],bytes(a)[2]);
    }
    function bytesToString(bytes memory _a) public pure returns(string memory){
        return string (_a);
    }
    //_a의 첫번째 글자를 뽑아내는것이 목표
        function bytesToString2(string memory _a) public pure returns(bytes1){
        bytes memory _b;
        _b = bytes(_a);
        return ( _b[0]);
    }
    function bytesToString3(string memory _a) public pure returns(string memory){
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[0];
        return string(_b);

    }
        function bytesToString4(string memory _a, uint _n) public pure returns(string memory){
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[_n-1];
        return string(_b);
    }

    
}

// contract LocalVariable{

// }