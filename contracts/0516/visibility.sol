// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Dad {
    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}

contract Mom {
    function sub(uint a, uint b) public pure returns(uint) {
        return a-b;
    }
}

contract Child is Dad {
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function mul2(uint a, uint b) virtual public pure returns(uint) {
        return a*b*2;
    }

    function addDoubleTime(uint a, uint b) public pure returns(uint) {
        return Dad.add(a,b)*2;
    }
}

contract Child2 is Dad, Mom {
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }
}

contract GrandChild is Child {
    function div(uint a, uint b) public pure returns(uint) {
        return a/b;
    }
}

contract GrandChild2 is Child {
    function mul2(uint a, uint b) override public pure returns(uint) {
        return a*a*b;
    }
}


contract DAD {
    uint a;  // default 값은 internal 
    address public b;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금


    function password() private pure returns(uint) {
        return 1234;
    }

    function changeWallet(uint _n) internal  {
        wallet = _n;
    }

    // function getADdress() public returns (address) {
    //     return address(this)
    // }
}

contract MOM {
    DAD husband = new DAD();
    DAD realHusband;
        // DAD copyDad;
    
    constructor(address _a) {
        realHusband = DAD(_a);
    }

    function getWallet() public view returns (uint){
        return  husband.wallet();
    }

    function getRealWallet() public view returns (uint) {
        return realHusband.wallet();
    }

    function setDad(address _a) public view returns(uint){
        DAD copyDad = DAD(_a);
        return copyDad.wallet();
    }

    // function changeRealWallet(uint _a) public {
    //     realHusband.changeWallet(_a);
    // }

}

contract CHILD is DAD {

    DAD realDaddy;

    constructor(address _a) {
        realDaddy = DAD(_a);
    }


    function dadChangeWallet(uint _a) public {
        super.changeWallet(_a);
    }

    // function getFatherAddress() public view returns (address){
    //     return DAD.address;
    // }

  DAD daddy = new DAD();
  DAD daddy2 = new DAD();


}