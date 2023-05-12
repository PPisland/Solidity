// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Mapping{
    // 숫자형만 들어가는 10자리 고정된 배열
    uint[10] ten;
    
    // 그냥 무한정으로 들어가는 편한 배열
    uint[] infinity;

    function setTen(uint _k, uint _n) public {
        ten[_k-1] = _n ;
    }

    uint count;
    function setAuto(uint _n) public {
        ten[count++] = _n;
    }

    function setInfinity(uint _n) public {
        infinity.push(_n);
    }

    function setChange(uint _k, uint _n) public {
        infinity[_k-1] = _n;
    }

    // function getInfinity() public view returns (uint[]){
    //     return infinity;
    // }

    function addTen() public view returns (uint) {
        uint Sum;
        for(uint i=0; i<ten.length; i++){
            Sum = Sum + ten[i];
        }
        return Sum;
    }
}

