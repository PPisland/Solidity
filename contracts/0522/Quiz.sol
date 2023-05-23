
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Quiz{

    function Time(uint a) public pure returns(uint, uint, uint){

    uint hour;
    uint min;
    uint sec;

    hour = a / 3600 ;
    min = a/60%60;
        sec =a%60;
        return (hour,min,sec);
    }
}

contract CONCAT{
    function concat1(string memory a, string memory b) public pure returns(string memory ){
        return string(abi.encodePacked(a,b));
    }

    function concat2(string memory a, string memory b) public pure returns(string memory){
        return string.concat(a,b);
    }

    function concat3(uint a, string memory b, string memory c) public pure returns(string memory) {
        return string (abi.encodePacked(a,b,c));
    }

    function returnEncodePacked(uint a, string memory b) public pure returns(bytes memory, bytes memory) {
        return (abi.encodePacked(a), abi.encodePacked((b)));
    }

    function concat4(uint a, uint b, uint c) public pure returns(string memory) {
           a = a+48;
           b = b+48;
           c  = c+48;
        return string(abi.encodePacked(a,b,c));
    }
    Q5 q5 = new Q5();
    Quiz q7 = new Quiz();

    function concat5(uint a) public view returns(string memory) {
        uint b = q5.getLength(a);
    
     uint[] memory c = new uint[](b);
     c = q5.divideNumber(a);
     for(uint i =0; i<c.length; i++){
         c[i] +=48;
     }
     return string(abi.encodePacked(c));
    }
    
    function concat6(uint a, string memory b) public view returns(string memory){
        return string(abi.encodePacked(concat5(a),"hours",b));
    }
    function concat7(uint _n) public view returns(string memory) {
        (uint a, uint b, uint c) = q7.Time(_n);
        return string(abi.encodePacked(concat5(a),"hours ", concat5(b), "minutes ", concat5(c), "seconds"));
    }
}

contract Q5 {
    function divideNumber(uint _n) public pure returns(uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n);
        while(_n !=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b);
    }

    function getLength(uint _n) public pure returns(uint) {
        uint a;
        while(_n > 10**a) {
            a++;
        }
        return a;
    }
}
