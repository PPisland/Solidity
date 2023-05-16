// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract Quiz{
    //     자동차를 운전하려고 합니다.
    // 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    enum Status { //enum 변수명 {변수1, 변수2, 변수3, 변수4}
      Stop, // - 0
      Driving,   // - 1
      End,   // - 2
      NoGas  // - 3
    }

    Status st;
    uint speed = 0;
    uint gas = 100;
    // 정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 
    function setSt() public {
        if(speed == 0) {
         st = Status.Stop;
      }  else {
         st = Status.Driving;
      }
    }

    function getSt() public view returns (Status ){
        return st;
    }
    // * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
    function Accel () public {
        require(gas>=30 && gas<=70);
                speed++;
        gas = gas -2;
    }
    // * 브레이크 기능 - 속도를 1 줄이는 기능, 속도가 0인 상태, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function brake () public {
        require(speed!=0);
            speed--;
            gas --;
        
    }
    // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function PowerOff () public {
        require(speed == 0, "Speed is not zero");
        st = Status.End;
    }
    // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function PowerOn () public{
        require(st == Status.End, "Not Power Off");
        st = Status.Stop;

    }
    // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function Refuel() payable public {
         require(msg.value == 1 ether, "Please send exactly 1 ETH");
         gas = 100;
    } 


    // 지불은 smart contract에게 함.      
    receive() external payable {}
    // ----------------------------------------------------------------------------------------
    // * 주유소 사장님은 2번 지갑의 소유자임, 주유소 사장님이 withdraw하는 기능
    address GasStation = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    function withdraw(uint _amount) public {
        require(msg.sender == GasStation, "Sender isn't GasStation");
        payable(this).transfer(_amount);
    }
    // * 지불을 미리 하고 주유시 차감하는 기능 

    // enum, payable, require 활용

 
    
}