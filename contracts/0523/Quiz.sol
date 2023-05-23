
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Quiz{
    //     로또 프로그램을 만드려고 합니다. 숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더, 4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 
    // 참가 금액은 0.05이더이다.
    // 기준 숫자 : 1,2,3,4,A,B
    // 1000finney 가 1이더
    struct Numbers {
        uint[4]  digits;  // 숫자
        string letter1;  // 문자
        string letter2;  // 문자
    }

    mapping(address => Numbers) public selectNum;  

    function JoinGame(uint[4] memory _num, string memory _alpha, string memory _beta) public payable  {
         require(msg.value == 0.05 ether);
        // require(selectNum[msg.sender].digits[0] == 0);


        selectNum[msg.sender] = Numbers(_num, _alpha, _beta);
        payable (msg.sender).transfer(checkNum());
    }

    // function 

    function checkNum() public view returns (uint) {
        // uint[4] num = [uint(1),2,3,4];
        uint[4] memory winningNum ;
        winningNum[0] = 1;
        winningNum[1] = 2;
        winningNum[2] = 3;
        winningNum[3] = 4;

        Numbers memory winningNumbers = Numbers(winningNum, "A", "B");
        Numbers memory player = selectNum[msg.sender];
        
        uint correctNum;

        for (uint i = 0; i < 4; i++) {
            if (player.digits[i] == winningNumbers.digits[i]) {
                correctNum++;
            }
        }
        
        if (keccak256(abi.encodePacked(player.letter1))  == keccak256(abi.encodePacked(winningNumbers.letter1))) {
            correctNum++;
        }
        if (keccak256(abi.encodePacked(player.letter2))  == keccak256(abi.encodePacked(winningNumbers.letter2))) {
            correctNum++;
        }


        if (correctNum == 6) {
            return 1 ether;
        } else if (correctNum == 5 ) {
            return 0.75 ether;
        } else if (correctNum == 4) {
            return 0.25 ether;
        } else if (correctNum == 3) {
            return 0.1 ether;
        } else {
            return 0;
        }
    }


    // -----------------------------------------------------------------
    // * 기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음. 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정
    // 예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
    // 예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i
}