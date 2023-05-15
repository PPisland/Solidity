
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Quiz{



    // 1. 더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요

    // function
 
        
        
    // 1. 2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.

        

       function Add (uint a, uint b) public pure returns(uint){
            return a+b;
        }
        function Sub (uint a, uint b) public pure returns(uint){
            return a-b;
        }
        function Mul (uint a, uint b) public pure returns(uint){
            return a*b;
        }
        function Div (uint a, uint b) public pure returns(uint){
            return a/b;
        }
        
    // 1. 2개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.
    function square(uint a, uint b) public pure returns(uint, uint)
    {
        return (a *a, b*b);
    }

       function triple(uint a, uint b) public pure returns(uint , uint)
    {
        return (a**3, b**3);
    }


    // 1. 이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 그 구조체들을 관리할 수 있는 array, students를 선언하세요.
       struct  student {
            string name;
            uint number;
            string[] classes;
       }
        

        student[] students;
    // 1. 아래의 함수를 만드세요
        uint t;
    //     1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
        function square2(uint _t) public  {
            if(0<t && t<4){
                t = (_t ** 2);
            }
        }

        
    //     4~6을 입력하면 입력한 수의 2배를 반환받습니다.
        function double(uint _t) public {
            if(3<_t && t<7){
                t = (_t *2);
            }
        }
        
    //     7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
    function rest(uint _t) public {
            if(6<_t && t<10){
                t = (_t %3);
            }
        }
    
    function getT() public view returns (uint) {
        return t;
    }
    // 1. 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
    uint[] numbers;

    function setNum() public {
        for( uint i=0; i<10; i++){
        numbers.push(i);
        }
    }
        
    // 1. 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
    function setAdd() public returns(uint) {
        uint u;
        for(uint i=0; i<5; i++){
            numbers.push(i);
            u= u+ numbers[i];
        }
        return u;
    }
        
    // 1. 아래의 함수를 만드세요
        
    //    1~10을 입력하면 “A” 반환받습니다.        
    //     11~20을 입력하면 “B” 반환받습니다.        
    //     21~30을 입력하면 “C” 반환받습니다.
     function setABC(uint x) public pure returns(string memory)
     {
         if(0<x && x<11){
             return "A";
         } 
         else if(10<x && x<21){
             return "B";
         } 
         else if(20<x && x<31){
             return "C";
         } else{
             return "D";
         }
     }
        
    // 1. 문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.
    function stringtoBytes(string memory _a) public pure returns (bytes memory){
        return bytes(_a);
    }
        
    // 1. 숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
    uint[] numbers2;

    function getPush(uint _a) public {
        numbers2.push(_a);
    }

    function getPop() public{
        numbers2.pop();
    }

    function getNum(uint _n) public view returns (uint) {
        return numbers2[_n];
    }
    //
 }