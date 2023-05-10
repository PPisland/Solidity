// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;
/*
실습가이드
1.0x10, 0x11, 0x12 넣어서 setABC 해보기 -> 오류 확인 incorrect data length
2.0x10, 0x11, 0x0012 넣어서 setABC 해보기
3.0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3
4.getABCD결과 확인
*/ 

contract BYTES {
    bytes a; //사실상 무한정 -> 자리수 동적
    bytes1 b; // 자리수 정적(결정됨) => 16진수 2자리
    bytes2 c; // 자리수 정적(결정됨) => 16진수 4자리
    bytes32 d; // 자리수 정적(결정됨) => 16진수 64리
    
    //bytes 는 special array라서 앞에 memory를 붙여줘야함 하지만 bytes1,2 는 크기가 정해져있기 때문에 적어줄 필요가 없다
    function setABC(bytes  memory _a, bytes1  _b, bytes2  _c) public {
        a= _a; 
        b= _b;
        c= _c;
    }

    //bytes memory와 bytes32는 엄연히 다르다 bytes memory는 자리수를 최대한 많이 준비해놓기때문에 고로 d에 bytes memory 를 적으면 오류가 난다.
     function setABC2(bytes  memory _a, bytes1  _b, bytes2 _c, bytes32 _d) public {
        a= _a;
        b= _b;
        c= _c;
        d= _d;
    }

    function getABC() public view returns(bytes memory, bytes1, bytes2, bytes32){
        return (a,b,c,d);
    }


}