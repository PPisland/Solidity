
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract Quiz1{
    //     Quiz 01 PrizeDistribution

    // 여러 사람이 참여하는 게임에서 승리한 플레이어에게 상금을 분배해야 합니다.

    // 1번 지갑은 주최자입니다. 주최자는 게임 시작 시 (deploy할 때) 1eth를 상금으로 겁니다.
    address  public owner;
    uint totalPrize;
    constructor () payable {
        payable(this).transfer(msg.value);
        owner = (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        totalPrize = msg.value;
    }
    receive() external payable{}
    // 참가자는 이름, 점수를 필수로 가집니다.
    struct User{
        string name;
        uint score;
        bool isWinner;
    }
    modifier owner_check{
        require(msg.sender == owner, "Only owner can do this fn");
        _;
    }
    // User[] users;
    mapping(address=>User) public Players;
    address [] allPlayers;
    address [] Winner;
    // 참가자는 0.01eth를 지불해야 게임에 참여할 수 있습니다.
    // 지불한 금액은 총 상금에 포함됩니다.
    function JoinGame(string memory _name) public payable {
        require(msg.value == 2 ether);     
        Players[msg.sender].name = _name;
        Players[msg.sender].score = 0;
        Players[msg.sender].isWinner = false;
        allPlayers.push(msg.sender);
        totalPrize += 2 ether;
    }

    // 주최자는 참가자들의 점수를 설정합니다. (주최자만 가능해야 합니다.)
    function setScore(address _player, uint _score) public owner_check {        
        require(Players[_player].score == 0, "Score already set");
        Players[_player].score = _score;  
    }
    // 가장 높은 점수를 가진 사람들이 상금을 나눠가집니다. (1/n)
    function determinWinner() public  owner_check {
        uint hightestScore = 0;
        // address[] memory Winners;
        //가장 높은 점수를 찾기
        for( uint i =0 ; i < allPlayers.length; i++){
            address addr = allPlayers[i];
            uint playerScore = Players[addr].score;

            if(playerScore>hightestScore){
                hightestScore = playerScore;
            }            
        }

        for( uint i = 0; i< allPlayers.length; i++){
            address addr = allPlayers[i];
            if(Players[addr].score == hightestScore){
                // Winners[i] = allPlayers[i];
                Winner.push(addr);
            }
        }
        for(uint i=0; i<Winner.length; i++){
            payable(Winner[i]).transfer(address(this).balance/Winner.length);
        }
        // return Winners;

        // require(owner == msg.sender);
        // Winner[i].transfer(address(this).balance);
    }
    // 가장 높은 점수를 가진 사람은 여러 명 일 수 있습니다.
    function distibutePrize() public owner_check {
        require(Winner.length >0 , "No winnners");
        uint prize = totalPrize/ Winner.length;

           for(uint i=0; i<Winner.length; i++){
            payable(Winner[i]).transfer(prize);
        }
    }

}