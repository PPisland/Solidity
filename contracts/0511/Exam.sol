// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Exam{

    //여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }

    Student[] students;
    
    // 번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.
    // uint count = 1;
    // 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
        function setGrade(uint _score) public pure returns (string memory) {
        if(_score >= 90){
            return "A";
        } else if(_score >= 80) {
            return "B";
        } else if(_score >= 70) {
            return "C";
        } else if(_score >= 60) {
            return "D";
        } else  {
            return "F";
        }
    }
    // 필요한 기능들은 아래와 같습니다.

    // * 학생 추가 기능 - 특정 학생의 정보를 추가
    function setStudent(string memory _name,uint _score,  string[] memory _classes) public {

        students.push(Student(_name, /*count++*/ students.length+1 , _score,setGrade(_score),_classes));
        Name_Student[_name] = Student(_name,students.length ,_score,setGrade(_score), _classes );
    }
    // * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudentfromNum(uint _number) public view returns (Student memory){
        return students[_number-1];
    }

    // function getStudent(uint _n) public view returns (Student memory){
    //     return students[_n];
    // }
    // * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    mapping(string=>Student) Name_Student;
    function setName_Student( string memory _name, uint _number,uint _score, string memory _credit, string[] memory _classes) public {
        Name_Student[_name] = Student(_name, _number,_score,_credit,_classes);
    }

     function getName_Student(string memory _name) public view returns (Student memory) {
        return Name_Student[_name];
    }
    // * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    mapping (string=>uint) Name_Score;
    // function setName_Score(string memory _name, uint _score) public{
    //     Name_Score[_name] = Student(_score);
    // }
    // * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getStudentNum() public view returns(uint) {
        return students.length;
    }
    // * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getStudent() public view returns (Student[] memory) {
        return students;
    }
    // * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAverage() public view returns (uint) {
    uint sum ;
        for(uint i=0; i<students.length; i++){
            sum = sum + students[i].score;
        }
        return (sum/students.length);
    }
    // * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function system() public view returns (bool){
        if(getAverage() > 70){
            return true;
        } else{
            return false;
        }

    }
    // * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function Bochung () public view returns (uint, Student[] memory){
        uint num; // F학점 학생 수
        // Student[] memory BochungStudents = new Student[](num);
        for( uint i =0; i<students.length; i++){
            if(keccak256(bytes(students[i].credit))  == keccak256(bytes("F"))){
                num ++;
                // F_students[] = students[i];
            }
        }

        Student[] memory F_students = new Student[](num); // num만큼의 array // byteToString4 참고;
        
        uint _num;

        for( uint i =0; i<students.length; i++){
            if(keccak256(bytes(students[i].credit))  == keccak256(bytes("F"))){
                // num ++
                F_students[_num] = students[i];
                _num++;
            }
        }

        return (num, F_students);
    }

  function FClass2() public view returns(/*Student[] memory*/ uint, uint, Student[] memory) {
        Student[] memory F_Students = students;
        Student[] memory F_Storage;

        uint count;

        for(uint i=0; i<students.length; i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                count++;
                F_Students[count-1] = students[i];
                F_Storage = new Student[](count);
                for(uint j=0; j<count; j++) {
                    F_Storage[j] = F_Students[j];
                }
            }
        }
        return (F_Storage.length, count, F_Storage);
    }



    // -------------------------------------------------------------------------------
    // * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    function SClass() public view returns(Student[] memory){
        Student[] memory S_Students = students;
        Student[] memory S_Class = new Student[](4);


        for(uint j=1; j<S_Students.length; j++) {
            for(uint i=0; i<j; i++) {
                if(S_Students[i].score < S_Students[j].score){
                (S_Students[i],S_Students[j]) = (S_Students[j],S_Students[i]);}
                }
        }

        for(uint i=0; i<4; i++) {
            S_Class[i] = S_Students[i];
        }

        return S_Class;
    }

    // 기입할 학생들의 정보는 아래와 같습니다.

    // Alice, 1, 85
    // Bob,2, 75
    // Charlie,3,60
    // Dwayne, 4, 90
    // Ellen,5,65
    // Fitz,6,50
    // Garret,7,85
    // Hubert,8,90
    // Isabel,9,100
    // Jane,10,70
}

contract STRING_Compare {
    function compare1(string memory s1) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(s1));
    }

    function keccak2(string memory s1) public pure returns(bytes32) {
        return keccak256(bytes(s1));
    }

    function compare3(string memory s1, string memory s2) public pure returns(bool){
        return keccak256(bytes(s1)) == keccak256(bytes(s2));
    }

        function compare4(string memory s1) public pure returns(bytes memory, bytes memory){
        return (abi.encodePacked(s1), bytes(s1));
    }
}

    contract Sorting {
        uint[] numbers;

        function push(uint _n) public {
            numbers.push(_n);
        }

        function sorting() public {
            for(uint i=0;  i<numbers.length-1; i++){
                for(uint j=i+1; j<numbers.length; j++) {
                    if(numbers[i] < numbers[j]){
                        (numbers[i],numbers[j]) = (numbers[j],numbers[i]);}
                }

            }
        }

        function sorting2() public {
            for(uint j=1; j<numbers.length; j++) {
                for(uint i=0; i<j; i++) {
                    if(numbers[i] < numbers[j]){
                        (numbers[i],numbers[j]) = (numbers[j],numbers[i]);}
                }
            }
        }

        function get() public view returns(uint[] memory) {
            return numbers;
        }
    }