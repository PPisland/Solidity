
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;
contract test{
    
     address payable owner;
    constructor() payable {
        payable(this).transfer(msg.value); // 배포할 때 msg.value 만큼 contract에게 바로 입금
        owner = payable(msg.sender); // 배포하는 지갑주소가 바로 owner로 설정
    }
}