// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MintToken is ERC20Burnable {
    constructor(uint256 _initialSupply, string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply*10**18);
    }
}
