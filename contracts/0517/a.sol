
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract A {

    uint public a;
    uint public b;
    uint public c;
    uint public d;

    function setABCD(uint _a, uint _b, uint _c, uint _d) public {
        (a,b,c,d) = (_a, _b, _c, _d); 
    }

    function ABC() public returns(string memory) {
        require(a ==0 && b != 1 || c ==0);
        /*
        a=0 b=2 c=2 <- 앞의 조건 2개 만족, 뒤의 조건 불만족 -> o
        a=0 b=1 c=0 <- 앞의 조건 1개 만족, 뒤의 조건 만족 -> o
        a=0 b=1 c=1 <- 앞의 조건 1개 만족, 뒤의 조건 불만족 -> x
        a=1 b=1 c=0 <- 앞의 조건 0개 만족, 뒤의 조건 만족 -> o
        a=1 b=1 c=1 <- 모두 불만족 -> x
        */
        return "aaa";
    }

    function ABC2() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0);
        /*
        (a // b,c)
        (a,b // c)
        (a,c // b)
        a=0, b=1, c=1 <- a만 만족 -> o
        a=1, b=2, c=1 <- b만 만족 -> x
        a=1, b=1, c=0 <- c만 만족 -> x
        a=0, b=2, c=1 <- a,b 만족 -> o
        a=0, b=1, c=0 <- a,c 만족 -> o 
        a=1, b=2, c=0 <- b,c 만족 -> o
        */
        return "aaa";
        /*
        0,0,0, -> o
        */
    }

    function ABCD() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0 || d==0);
        /*
        a=0, b=1, c=1, d=1 <- a만 만족 -> o
        a=1, b=0, c=1, d=1 <- b만 만족 -> x
        a=1, b=1, c=0, d=1 <- c만 만족 -> x
        a=1, b=1, c=1, d=0 <- d만 만족 -> o 
        a=0, b=0, c=1, d=1 <- a,b만 만족 -> o
        a=0, b=1, c=0, d=1 <- a,c만 만족 -> o
        a=0, b=1, c=1, d=0 <- a,d만 만족 -> o
        a=1, b=0, c=0, d=1 <- b,c만 만족 -> o
        a=1, b=0, c=1, d=0 <- b,d만 만족 -> o
        a=1, b=1, c=0, d=0 <- c,d만 만족 -> o
        a=0, b=0, c=0, d=1 <- a,b,c만 만족 -> 
        a=0, b=0, c=1, d=0 <- a,b,d만 만족 -> o
        a=0, b=1, c=0, d=0 <- a,c,d만 만족 -> o
        a=1, b=0, c=0, d=0 <- b,c,d만 만족 -> o
        */

        return "aaa";
    }
}

/*
실습가이드
B (deposit_payable, transferTo 함수 보유)
C1(receive, deposit_payable 함수 보유), C2 (deposit_payable 함수 보유, receive 함수 없음)

1. B 배포하고 5 ether deposit 하기, 잔액 변화 확인
2. transferTo로 2번 지갑에 1ether 전송해보기, 잔액 변화 확인 
3. transferTo로 C1, C2 전송 시도
4. C1은 성공, C2는 실패
*/

contract B {
    function deposit() public payable {}

    uint eth = 1 ether; /*지금 상황에서는 지역변수가 더 경제적, 보통의 경우 여러 payable 함수들에 활용되므로 상태변수로 설정*/

    function transferTo(address payable _to, uint amount) public {
        _to.transfer(amount * eth);
    }
}

contract C1 {
    function deposit() public payable {}
    receive() external payable{}
}

contract C2 {
    function deposit() public payable {}
}