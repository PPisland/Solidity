// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract Quiz{
    //     헬스클럽을 이용하는 회원들의 회비 납부를 도와주는 스마트계약을 작성한다.
    // 스마트 계약은 헬스클럽 운영자가 생성한다.
       address payable public owner;

    constructor() {
        owner = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); //0번 지갑 오너로 설정
    }

    modifier checkowner {
        require(msg.sender == owner);
        _;
    }
    // deadline 설정은 owner만 할 수 있고, 각각 일 수로, 시간 단위로 분 단위로 설정할 수 있는 함수 총 3개 만든다.
    // 회원은 구조체로 구현한다. 
    struct user{
        string name;
        uint deadline;
        uint  ticket;
        Status act;
    }
    mapping(string=>user) public userList;
    // block.timestamp;
    enum Status{
        On,
        Off    
    }
    function setUser(string memory _name ) public checkowner {
        userList[_name] = user(_name, block.timestamp,0,Status.Off);
    }
    function setDay(string memory _name, uint _n) public checkowner {
        userList[_name].deadline +=   (86400 * _n);
    }
     function setHours(string memory _name, uint _n) public checkowner {
        userList[_name].deadline +=  (3600 * _n);
    }
     function setMinutes(string memory _name, uint _n) public checkowner {
        userList[_name].deadline +=  (60 * _n);
    }
    // 회비 납부 데드라인 이전까지 회비를 납부하여야 헬스클럽을 이용할 수 있고, 회원 별로 헬스클럽을 이용할 수 있는 상태인지 알 수 있어야 한다.
    function checkAct(string  memory _name) public {
        require(block.timestamp < userList[_name].deadline && userList[_name].ticket != 0 );
        userList[_name].act = Status.On;
    }

    // 0.02eth 마다 1회 이용할 수 있다. 회원이 납부한 금액에 따라 이용횟수를 저장한다.
    function pay(string memory _name) public payable {
        require(msg.value>0.02 ether && msg.value % 0.02 ether == 0, "For more than 0.02 ether, please pay in units of 0.02 ether");
        uint payamount = (msg.value / 0.02 ether);
        userList[_name].ticket = payamount;
    }

    // 헬스장 이용 함수를 만든다. 이용을 하면 이용횟수가 1개 차감된다.
    function joinHealth(string memory _name) public {
        require(userList[_name].act == Status.On);
        userList[_name].ticket -= 1;
    }

    // 데드라인이 지나면 컨트랙트 계정에 입금된 금액 전체를 헬스클럽 운영자에게 전송해야 한다.
    // 출금
    function withdraw() public checkowner {
        owner.transfer(address(this).balance);
    }
}