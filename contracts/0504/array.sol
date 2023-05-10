// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract StringAndBytes{

}

contract Array{
    // array - 같은 자료형이 들어있는 집합
    uint[] numbers; // 자료형 [] array 이름
    string[] letters;

    //1.넣기
    function push(uint _a) public {
        numbers.push(_a);
    }
    //2.빼기
    function pop() public {
        numbers.pop();
    }
    //3.보기
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1]; //배열이름[n번째]

    }
    //4.길이
    function getLength() public view returns(uint){
        return numbers.length;
    }
    //5.바꾸기
    function changeNum(uint _k, uint _z) public{
        numbers[_k-1] = _z;
    }
    //6. 삭제
    function DeleteNum(uint _n) public{
        delete numbers[_n];
    }

    //7. 전체 array반환
    function returnArray() public view returns(uint[] memory){
        return numbers;
    }
}