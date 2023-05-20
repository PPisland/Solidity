// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract ps{
    //     1. 3의 배수만 들어갈 수 있는 array를 구현하세요.
    uint[] A;
    function setA(uint _a) public {
        require(_a%3 == 0);
        A.push(_a);
    }
        
    // 1. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    function sub(uint _a, uint _b) public pure returns(uint) 
    {
        if(_a>_b){
            return _a - _b;
        } else{
            return _b -_a;
        }
    }
    // 1. 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.

        
    // 1. string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.

        
    // 1. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 


        
    // 1. 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    uint[] odd;
    uint[] even;
    function holJJak(uint _a) public {
        if(_a %2==0){
            odd.push(_a);
        }else {
            even.push(_a);
        }
    }
        
    // 1. string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
    mapping(string=>uint) map;
    function setMap(string memory _key, uint _value) public {
        map[_key] = _value;
    }
    function deleteMap(string memory _key) public {
        delete map[_key];
    }
    function getMap(string memory _key) public view returns(uint){
        return map[_key];
    }

        
    // 1. ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    function getHash(string memory ID, string memory PW) public pure returns(bytes32) {
		return keccak256(abi.encodePacked(ID, PW));
	}
}

        
    // 1. 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
    contract Q26{
        uint a;
        string b;
        constructor(){
            a = 10;
            b = "A";
        }
        function getAB() public view returns(uint, string memory){
            return (a,b);
        }
    }
        
    // 1. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
    // (sorting 코드 응용 → 약간 까다로움)        
    //     예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
contract Q30{
    uint[]  A;
    function setA(uint _a) public {
        A.push(_a);
    }

    function Sort() public returns(uint [] memory){
        for(uint j=1; j<A.length; j++){
            for(uint i=0; i<j; i++){
                if(A[i] < A[j]){
                    (A[i],A[j]) = (A[j],A[i]);
                }
            }
        }
        return A;
    }

    // function SClass() public view returns(Student[] memory){
    //     Student[] memory S_Students = students;
    //     Student[] memory S_Class = new Student[](4);


    //     for(uint j=1; j<S_Students.length; j++) {
    //         for(uint i=0; i<j; i++) {
    //             if(S_Students[i].score < S_Students[j].score){
    //             (S_Students[i],S_Students[j]) = (S_Students[j],S_Students[i]);}
    //             }
    //     }

    //     for(uint i=0; i<4; i++) {
    //         S_Class[i] = S_Students[i];
    //     }

    //     return S_Class;
    // }
}