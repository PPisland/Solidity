// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

    //05-12
/*
실습가이드
1. 1번 지갑 준비(주소 복붙) -> setOwner, 2번 지갑 준비(주소 복붙) -> setA
2. deploy 후 1번 지갑으로 10eth -> deposit()
3. contract 잔액 변화 확인
4. 1번 지갑 넣고, 1000000000000000000 transferTo() -> 1번지갑, contract 잔액 변화 확인
5. 2번 지갑, 1000000000000000000, transferTo() -> 2번 지갑, contract 잔액 변화 확인

0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
*/

contract Note{
    address a;
    address payable owner; //돈을 받을 수 있는 아이

    function deposit() public payable returns (uint){
        return msg.value;
    }
    receive() external payable {} // 이 거래를 했을 때 돈을 받을 수 있는 애다
    // fallback() external  payable {}  아무것도 안적혀있거나 없는 함수를 오류처리할 때 (?) 부르는 함수

    function setOwner() public {
        owner = payable(msg.sender); //거래를 일으킨 사람
    }

      function getOwner() public view returns (address payable ) {
        return owner;
    }

    function setA() public {
        a = msg.sender;
    }

    function getA() public view returns (address) {
        return a;
    }

    //payable이 붙어야 돈을 받을 수 있음
    function transferTo(address payable _to, uint _amount) public {
        _to.transfer(_amount); //지갑주소.transfer(규모)
    }

    function traferToOwner(uint _amount) public {
        owner.transfer(_amount);
    }

    // function transferToA(uint _amount) public {
    //     a.transfer(_amount);
    // }
}