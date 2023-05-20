// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract Quiz{
    //     숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
    // 예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
    // --------------------------------------------------------------------------------------------
    // 문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
    // 예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f

// function intAnswer(uint number) public pure returns (uint, uint[] memory)  {
//     uint length =number;
//     index = new uint[](length);

//     for (uint i = 0; i < length; i++) {
        
//     }
    
//     return (length,index);
// }
}

contract Solution {
    // uint[] a;
    // function divideNumber_state(uint _n) public pure returns(uint, uint[] memory) {
    //     while(_n>10){
            
    //     a.push(_n%10);
    //     _n = _n/10;
    //     }
    // }
    function divideNumber(uint _n) public  pure returns (uint, uint[] memory){
        // uint a = getLength(_n);
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n) ;
        while(_n != 0){
            b[--i] = _n%10;
            _n = _n/10;
            // i++;
        }
        return (b.length,b);
    }

    function getLength(uint _n) public pure returns(uint){
        // for(uint i=0; /*조건문 비우기*/ ; i++){
        //     if(_n <10 ** i){
        //         return i;
        //     }
        // }
        uint a;
        while(_n > 10**a){
            a++;
        }
        return a;
    }

        function bytestoBytesArray(bytes memory _a) public pure returns(bytes1[] memory){
        bytes1[] memory a = new bytes1[](_a.length);
        for(uint i=0; i<_a.length; i++){
            a[i] = _a[i];
        }
        return a;
    }

    function stringToBytes1Array(string memory _string) public pure returns(uint, string[] memory){
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytestoBytesArray(bytes(_string));
        // return b_array;
            string[] memory s_array = new string[](b_array.length);
            
        for(uint i =0; i<s_array.length; i++){
            s_array[i] = string(abi.encodePacked(b_array[i]));
        }        
        return(s_array.length, s_array);

        
    }
}

contract WHILE {
    function while_1(uint _n) public pure returns(uint){
        uint b;
        while(_n<b) {
            b++;        
        }
        return b;
    }

    uint[] public a;
    function while_2(uint _n) public  returns(uint[] memory) {
        while(a.length<_n){
            a.push(a.length);
        }
        return a;
    }

    function while_3(uint _n) public pure returns(uint){
        uint _a;
        while(_n >= 10** _a){
            _a++;
        }
        return _a;

    }
}

contract REVERSEARRAY{
    function reverse( uint[] calldata numbers) public pure returns (uint[] memory) {
        uint[] memory _reverse = new uint[](numbers.length);
        for(uint i=0; i<numbers.length; i++){
            _reverse[i] = numbers[numbers.length-i-1];            
        }
        return _reverse;
    }
    
    function reverse2(uint[] memory numbers) public pure returns(uint[] memory){
        for(uint i=0; i<numbers.length/2; i++){
            (numbers[i], numbers[numbers.length-1-i]) = (numbers[numbers.length-1-i], numbers[i]);
        }
        return numbers;
    }
}

contract BYTES_LENGTH {
    function getLength1(bytes1 a) public pure returns(uint) {
        return a.length;
    }

    function getLength2(bytes2 a) public pure returns(uint) {return a.length;}

    function getLength3(bytes3 a) public pure returns(uint) {return a.length;}
    function getLength4(bytes memory a) public pure returns(uint) {return a.length;}

    function bytes1ToString(bytes1 a) public pure returns(string memory){
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }


}