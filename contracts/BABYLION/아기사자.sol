// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract FUND{
    //     펀딩을 하는 컨트랙트 만들기

    // 1. 펀딩이름, 펀딩 시작일, 펀딩 종료일, 펀딩 ID(문자열) 정보를 포함하는 funding 구조체 만들기
    struct funding{
        string name;
        uint startDay;
        uint endDay;
        string FundingID;
    }

    // 2. funding구조체형 변수 newFunding 만들기
    funding newFunding;

    function setFund(string memory _name, uint _startDay, uint _endDay, string memory _FundingID) public {
        newFunding = funding(_name, _startDay, _endDay, _FundingID);
    }

    function getFund() public view returns (funding memory) {
        return newFunding;
    }
    
    
    mapping(address=>uint) Who_Money;
}