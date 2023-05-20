
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Quiz{
    // 관리자 0번지갑

    //     간단한 게임이 있습니다.
    // 유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 
    struct User{
        uint number;
        string name;
        address wallet;
        uint balance;
        uint score;
    }

    User[] Participant;
    // 참가할 때 참가비용 0.01ETH를 내야합니다
    function joinGame() public payable {
    require(msg.value == 0.01 ether, "Please send 0.01 ETH");
    }
    // 4명까지만 들어올 수 있는 방이 있습니다. (array)
    // uint[4] room;
    // function Participant() public {

    // }

    // function JoinRoom (uint _number, string memory _name) public {
    //     require(Participant.length <4, "Room is Full");
    //     for(uint i = 0; i<Participant.length; i++){
    //     Participant.push(User(_number, _name, msg.sender));

    //     }
    //     // for(uint i=0; i<4; i++){
            
    //     // }
    // }
    // 선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.
    // function

    // 예) 
    // 방 안 : "empty" 
    // -- A 입장 --
    // 방 안 : A 
    // -- B, D 입장 --
    // 방 안 : A , B , D 
    // -- F 입장 --
    // 방 안 : A , B , D , F 
    // A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
    // 방 안 : "empty" 

    // 유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
    // 예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

    // * 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
    // * 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
    // * 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    // * 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
    // ---------------------------------------------------------------------------------------------------
    // * 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
}

contract Solution {
        
    // 간단한 게임이 있습니다.
    // 유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 
    struct User{
        uint number;
        string name;
        address account;
        uint balance;
        uint score;
    }
    address payable owner;

    constructor() {
        owner = payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
      modifier isitFour{
        if(getLengthOfTop4() ==4){
            delete  top4_2;
            _;
        }
        _;
    }
    mapping(address=>User) userList;
    // uint[] room;
    uint count;
    User[] public top4;
    User[4] public top4_2;
    // * 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
    function register(string memory _name) public{
        userList[msg.sender] = User(count++, _name, , msg.sender.balance, 0);
    }
    // * 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
    function search(address _a) public view returns(User memory) {
        return userList[_a];
    }
    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    function withdraw(uint _n) public {
        // 10점 단위로 넣는다고 가정
        require(_n%10 == 0 && userList[msg.sender].score >= _n);
        // 1점 단위로 넣는다고 가정
        // require(userList[msg.sender].score >= _n*10);
        userList[msg.sender].score-= _n;
        payable(msg.sender).transfer(_n%10*0.1 ether);
    }
    function withdraw_All() public {
        require(userList[msg.sender].score >=10);
        uint a = userList[msg.sender].score / 10;
        userList[msg.sender].score = userList[msg.sender].score%10;
        payable(msg.sender).transfer(a*0.1 ether);
    }
    // 참가할 때 참가비용 0.01ETH를 내야합니다.
    function gameIn() public payable {
        require((userList[msg.sender].balance >=10**16 && msg.value ==0) || msg.value == 0.01 ether);
        if(msg.value == 0){
            userList[msg.sender].balance -= 10**16;
        }
        if(top4.length == 4){
            for(uint i=4; i>0; i--){
                // top4[i-1].score += 5-i;
                userList[top4[i-1].account].score += 5-i;
                // top4.pop();
            }
            delete top4;
        }
        top4.push(userList[msg.sender]);
    }
    function gameIn2() public  payable {
        require((userList[msg.sender].balance >=10**16 && msg.value ==0) || msg.value == 0.01 ether);
        if(msg.value == 0){
            userList[msg.sender].balance -= 10**16;
        }
        if(getLengthOfTop4() ==4){
              for(uint i=4; i>0; i--){
                userList[top4_2[i-1].account].score += 5-i;
            }
            delete top4_2;
        }
        top4_2[getLengthOfTop4()] = userList[msg.sender];

        
    }
     /*
		위의 gameIn2()를 modifier를 사용해본 버전
		modifier isitFour {
        if(getLengthOfTop4()==4) {
            delete top4_2;
            _;
        }
        _;
    }

    function gameIn2_2() public payable isitFour {
        require((userList[msg.sender].balance >= 10**16 && msg.value==0) || msg.value == 0.01 ether);

        if(msg.value==0) {
            userList[msg.sender].balance -= 10**16;
        }

        top4_2[getLengthOfTop4()] = userList[msg.sender];
        
    }*/
    function getLengthOfTop4 ()public view returns(uint) {
        for(uint i=0; i<4; i++){
            if(top4_2[i].account==address(0)){
                return i;
            }
        }
        return 4;
    }
  
    // * 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
    function ownerWithdraw(uint _n) public onlyOwner{
        owner.transfer(_n * 1 ether);
    }
       function ownerWithdraw_All() public onlyOwner{
        owner.transfer(address(this).balance);
    }
    // * 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
    function deposit() public payable {
        userList[msg.sender].balance += msg.value;
    }

    
    // 4명까지만 들어올 수 있는 방이 있습니다.
    // 선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

    // 예) 
    // 방 안 : "empty" 
    // -- A 입장 --
    // 방 안 : A 
    // -- B, D 입장 --
    // 방 안 : A , B , D 
    // -- F 입장 --
    // 방 안 : A , B , D , F 
    // A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
    // 방 안 : "empty" 

    // 유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
    // 예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

    // * 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    // ---------------------------------------------------------------------------------------------------
    


}

// contract solution2{
//      function enter_game() public payable {

//         require( msg.value == 1 ether ) ;

//         room.push( userMap[ msg.sender ] ) ;
//         // room[ i ] : i 번째에 방으로 들어온 유저의 번호
        
//         if( room.length == 4 ) { // 방에 들어와봤더니 내가 마지막. 4명

//             for( uint i = 0 ; i < 4 ; i ++ ){
                
//                 // i : 0 ~ 3 
//                 /*
//                 i : 0     4 - i = 4
//                 i : 1     4 - i = 3
//                 i : 2     4 - i = 2
//                 i : 3     4 - i = 1
//                 */
                
//                 // room[ i ] 가 받을 점수 ( 4 - i )
//                 userList[ room[ i ] ].score += ( 4 - i ) ;

//                 /*
//                 room[ 0 ] , 4점
//                 room[ 1 ] , 3점
//                 room[ 2 ] , 2점
//                 room[ 3 ] , 1점
//                 */

//             }

//             delete room ;

//         }
        

//     }
// }

contract POPvsDELETE {
    uint[] a;
    uint[4] b;

    function pushA(uint _n) public {
        a.push(_n);
    }

    function popA() public {
        a.pop(); //41551, 26531, 10267 / 41551, 26531, 10267 / 41551, 26531, 10267 / 47071, 25065, 10267
    }

    function deleteA() public {
        delete a; // 81202, 37288, 25546
    }
}

contract FixedDynamic{
    uint[] public a;
    uint[4] public b;

    function getAB() public view returns(uint[]  memory, uint[4] memory){
        return (a,b);
    }

    function pushA(uint _n) public {
        a.push(_n);
    }

    function pushB(uint _a, uint _b) public {
        b[_a-1] = _b;

    }
    function pushB2(uint _a)public {
        require((_a != 0));
        if(getLengthOfB() == 4){
            delete b;
        }
        b[getLengthOfB()] = _a;
    }

    function getLengthOfB() public view returns (uint){
        for(uint i=0; i<4; i++){
            if(b[i] ==0){
                return  i;
            }
        }
        return 4;
    }
}