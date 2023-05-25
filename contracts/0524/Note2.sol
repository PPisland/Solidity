// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Note2{
    function crueentTime() public view returns(uint) {
        return block.timestamp;
    }

    function getTime() public view returns(uint) {
        return block.timestamp + 100;
    }

    function getTime2() public  view returns (uint) {
        return block.timestamp + 10 seconds;
    }

    function getTime3() public view returns(uint) {
        return block.timestamp + 10 minutes;
    }

    function getTime4() public view returns(uint) {
        return block.timestamp + 1 hours;
    }

     function getTime5() public view returns(uint) {
        return block.timestamp + 1 days;
    }
}

contract ADDRESS {
    function getBalance(address _a) public view returns(uint) {
        return _a.balance;
    }

    function getCode(address _a ) public view returns(bytes32) {
        return _a.codehash;
    }
}

// 608060405234801561001057600080fd5b506102a4806100206000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c80637e105ce21461003b578063f8b2cb4f1461006b575b600080fd5b6100556004803603810190610050919061015b565b61009b565b6040516100629190610218565b60405180910390f35b6100856004803603810190610080919061015b565b6100d7565b6040516100929190610253565b60405180910390f35b60608173ffffffffffffffffffffffffffffffffffffffff16803b806020016040519081016040528181526000908060200190933c9050919050565b60008173ffffffffffffffffffffffffffffffffffffffff16319050919050565b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000610128826100fd565b9050919050565b6101388161011d565b811461014357600080fd5b50565b6000813590506101558161012f565b92915050565b600060208284031215610171576101706100f8565b5b600061017f84828501610146565b91505092915050565b600081519050919050565b600082825260208201905092915050565b60005b838110156101c25780820151818401526020810190506101a7565b60008484015250505050565b6000601f19601f8301169050919050565b60006101ea82610188565b6101f48185610193565b93506102048185602086016101a4565b61020d816101ce565b840191505092915050565b6000602082019050818103600083015261023281846101df565b905092915050565b6000819050919050565b61024d8161023a565b82525050565b60006020820190506102686000830184610244565b9291505056fea264697066735822122084b3d2742fdf160771a2416b64794ea2c08c260ba0e355cdaa62ab7dfe0dd3bf64736f6c63430008120033