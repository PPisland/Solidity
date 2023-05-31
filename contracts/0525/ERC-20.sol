// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract LION is ERC20("Like Lion","LION"){
    constructor(uint _totalSupply){
        _mint(msg.sender, _totalSupply);
    }

    function getBalance() public view returns(uint) {
        return balanceOf(msg.sender);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
}

    receive () external payable{}
}


contract TRASH is ERC20("Trash", "T") {
    constructor() {
        //_mint(msg.sender, totalSupply);
        owner = msg.sender;
    }

    address public owner;

    mapping(address => uint256) private _balances;
    bool goodMind = true;

    function changeGoodMind() public {
        require(owner ==msg.sender, "you are not owner");
        goodMind = false;
    }

    // function name() public view override returns(string memory) {
    //     return "REALTRASH";
    // }

    // function symbol() public view override returns(string memory) {
    //     return "RT";
    // }

    // function decimals() public view override returns(uint8) {
    //     return 0;
    // }

    function _mint(address account, uint _a) internal override {
        _balances[account] += _a;
    }

    function MINT(uint _a) public {
        _mint(msg.sender, _a);
    }

    function balanceOf(address account) public view override returns(uint) {
        // if(account == 0x2cd342da5ab47C192026542c7DcAddA33072f9FF) {
        //     return 500;
        // } else {
        //     return _balances[account];
        // }
    if( goodMind ) return _balances[account] ;
    else return 0 ; //  _transfer(피해자주소, 악마주소, 전액);

    }
}

    // function putMyWallet(string calldata _name, address _addr) public {
    //     walletList[_name] = _addr;
    // } // "putmyWallet(string,address)" 괄호없애고 인풋값, 이름넣기, 앞뒤로 따옴표 붙여주기 <= getMethodID 에 넣기


contract getFunctionID{
    function firstFourBytes(bytes20 _a) public pure returns(bytes4){
        return bytes4(_a);
    }

    function getMethodID(string calldata _a) public pure returns(bytes4) {
        return bytes4(keccak256(bytes(_a)));
    }
}