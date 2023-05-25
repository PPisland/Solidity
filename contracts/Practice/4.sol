// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract ps{

    //     1. string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
    function getAlice(string memory _name) public pure returns(bool){
        if(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice")) || keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bob"))){
            return true;            
        }else {
            return false;
        }
    }

    // 1. 3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
        uint[]  array;
    function three(uint _a) public {
        require(_a%3 == 0);
        require(_a%10 == 0);
        array.push(_a);

    }

    // 1. 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요. 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
    struct user {
        string name;
        uint number;
        address by;
        string birth;
    }
    mapping(string=>user) public userlist;
    function pushUsers(string memory _name,uint _number, string memory _birth ) public {
        userlist[_name] = user(_name,_number,msg.sender,_birth);
    }

    // 1. 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요. 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
    struct Student{
        string name;
        uint number;
        uint score;
    }
    Student[] students;
    uint count;
    function setStudent(string memory _name, uint _score) public {
        students.push(Student(_name,count++, _score));
    }
    function getAvg() public view returns(uint) {
        uint _score;
        for(uint i=0; i<students.length; i++){
            _score += students[i].score;
        }
        return (_score/students.length);
    }

    // 1. 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
    // uint[] array2;
    // function setArray2(uint _a) public {
    //     array2.push(_a);        
    // }
    // function odd() public view returns(uint[] memory){
    //     uint[] memory array22 = new uint[](0);
    //     for(uint i =0; i<array2.length; i++){
    //         if(array2[i]%2 == 0){
    //             array22.push(array2[i]);
    //         }
    //     }
    //     return array22;
    // }


        
    // 1. high, neutral, low 상태를 구현하세요. a라는 변수의 값이 7이상이면 high, 4이상이면 neutral 그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.

    // 1. 1 wei를 기부하는 기능, 1finney를 기부하는 기능 그리고 1 ether를 기부하는 기능을 구현하세요. 최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 다른 이들은 못하게 막는 함수도 구현하세요.
        
    //     (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)    

    // 1. 상태변수 a를 "A"로 설정하여 선언하세요. 이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요. 단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
        
    //     (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)

        
    // 1. 특정 숫자의 자릿수까지의 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
        
    //     예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개) // 100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)

        
    // 1. 숫자를 임의로 넣었을 때 오름차순으로 정렬하고 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
        
    //     예) [5,2,4,7,1] -> [1,2,4,5,7], 4 // [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 // [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
}