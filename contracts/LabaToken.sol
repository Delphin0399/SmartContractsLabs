// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LabaToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("LabaToken", "LAB") {
        _mint(msg.sender, initialSupply);
    }
}