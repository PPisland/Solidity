// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract Quiz{
    // 흔히들 비밀번호 만들 때 대소문자 숫자가 각각 1개씩은 포함되어 있어야 한다 등의 조건이 붙는 경우가 있습니다. 그러한 조건을 구현하세요.
    // function Password (string memory password) public pure returns(bool) {



    function stringToBytes1Array(string memory _password) public pure returns(bool) {
        bool big;
        bool small;
        bool num;

       bytes memory pw = bytes(_password);
        for(uint i=0; i<pw.length; i++) {
            bytes1 letter = pw[i];
            if (letter >= 0x30 && letter <= 0x39) {
                small = true;
            } else if (letter >= 0x41 && letter <= 0x5A) {
                big = true;
            } else if (letter >= 0x61 && letter <= 0x7A) {
                num = true;
            }
        }
            return small && big && num; 
    }


}