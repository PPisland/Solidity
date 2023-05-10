// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Note{
    // 
    struct ABC{
        //ABC라는 구조체 안에는 숫자형 a, 문자형 b, 문자형 array c가 들어있다.
        uint a;
        string b;
        string[] c;
    }

    // abc가 들어가는 array abcs를 구현하고 abcs에 abc를 넣는 함수;
    ABC[] ABCs;

    function pushABCs(uint _a, string memory _b, string[] memory _c) public {
        ABCs.push(ABC(_a,_b,_c));
    }

    //특정 ABC를 반환하는 함수 ABCs 전체를 반환하는 함수
    function getABC(uint _n) public view returns (ABC memory) {
        return ABCs[_n-1];
    }

    function getABCs() public view returns (ABC[] memory) {
        return ABCs;
    }

    //특정 ABC의 c array를 반환받는 함수를 가각 구현하시오.
    function getcarray(uint _n) public view returns (string[] memory){
        return ABCs[_n-1].c;
    }
}

contract Mapping{
    mapping(uint =>uint) a;
    mapping(string => uint) b;



    function setB(string memory _b, uint _num) public {
        b[_b] = _num;
    }

    function getB(string memory _b) public view returns (uint) {
        return b[_b];
    }

    struct Student{
        uint number;
        string name;
        string[] classes;
    }

    mapping (string => Student) Teacher_Student;

    function setStudent(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public{
        Teacher_Student[_Teacher] = Student(_number, _name, _classes);
        
    }

    function getTeacher_Student(string memory _Teacher) public view returns (Student memory){
        return  Teacher_Student[_Teacher];
    }
}
contract Mapping2{
    struct Student{
        uint number;
        string name;
        string[] classes;
    }
  
    
    mapping(string=> Student) Teacher_Student;
    mapping(string=> Student[]) Teacher_Class;

    function setTeacher_Student(string memory _teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_teacher] = Student(_number,_name,_classes);
    }

    function getTeacher_Student(string memory _teacher) public view returns (Student memory) {
        return Teacher_Student[_teacher];
    }

    function setTeacher_Class(string memory _Teacher, uint _number, string memory _name,  string[] memory _classes)public {
        Teacher_Class[_Teacher].push(Student(_number,_name,_classes));
    }

    function getTeacher_Class(string memory _teacher) public view returns (Student[] memory) {
        return Teacher_Class[_teacher];
    }

}

contract Note2{
    function forLoop() public pure returns(uint) {
        uint a;

        for(uint i=1; i<6; i++){
            a = a+i;
        }

        return a;
    }

    function forLoop2() public pure returns(uint,uint) {
        uint a;
        uint i;

        for( i=1; i<6; i++){
            a = a+i;
        }

        return (a,i);
    }

    function forLoop3() public pure returns(uint,uint) {
        uint a;
        uint i;

        for( i=1; i<=6; i++){
            a = a+i;
        }

        return (a,i);
    }

        
    uint[4] c;
    uint count;

    function pushA(uint _n) public {
        c[count++] = _n;
    }

    function getC() public view returns (uint[4] memory) {
        return c;

    }

    function forLoop4() public view returns(uint){
        uint a;
        for(uint i=0; i<4; i++){
            a=a+c[i];
        }
        return a;
    }

    function forLoop5() public view returns(uint){
        uint a;
        for(uint i=0; i<c.length; i++){
            a=a+c[i];
        }
        return a;
    }

    uint[] d;
    
    function pushd(uint _n)public{
        d.push(_n);
    }

    function getD() public view returns (uint[] memory) {
        return d;
    }

    function forLoop6() public view returns(uint) {
        uint a;
        for(uint i=0; i<d.length; i++){
            a=a+d[i];
        }
        return a;
    }

    
}

contract fixedArray{
    uint[] a;
    uint[4] b; // 정적인 길이의 배열

    function getALength() public view returns (uint) {
        return a.length;
    }

    function pushA(uint _n) public {
        a.push(_n);
    }
    
    function getA() public view returns (uint[] memory) {
        return a;
    }

     function getBLength() public view returns (uint) {
        return b.length;
    }


     // 정적인 배열(fixedArray)에는 pop이나  push함수를 쓸 수 없다. (길이가 변하기 때무네)
    function pushB(uint n,uint _n) public {
        b[n] = _n;
    }

    uint count;

    function pushB2(uint _n) public {
        b[count++] = _n;
    }

    function getB() public view returns(uint[4] memory){
        return b;
    }

}

