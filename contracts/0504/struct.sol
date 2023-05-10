// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Struct {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birth;
        //구조체 선언 struct 구조체명 {.../.../...}        
    }

    Student s; //Student형 변수 s
    Student[] students;

    function setStudent(string memory _name,string memory gender,  uint _number, uint _birth) public {
       s =  Student(_name,  gender,_number, _birth);
    }
    function getStudent() public view returns(Student memory){
        return s;
    }
    
    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth));
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint){
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory){
        return (students[_n]);
    }

    function getStudents() public view returns(Student[] memory){
        return students;
    }
}

