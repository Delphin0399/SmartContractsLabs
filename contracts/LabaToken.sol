// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import '@openzeppelin/contracts/access/Ownable.sol';

contract LabaToken is ERC20, Ownable {
    struct NewStruct {
        bool logicValue;
        int intValue;
        address addressValue;
        bytes4 bytes4Value;
    }
    
    mapping (address => NewStruct) public structures;
    address[] public structuresList;

    event TestEvent(string text);

    function add(address addr) public {
        NewStruct memory a;
        a.logicValue = true;
        a.intValue = 100;
        a.addressValue = address(0x02);
        a.bytes4Value = bytes4(0x12345678);
        structuresList.push(addr);
        structures[addr] = a;
    }
    
    constructor(uint256 initialSupply) ERC20("LabaToken", "LAB") {
        _mint(msg.sender, initialSupply);

        //Тестовое событие
        emit TestEvent("Hello, this is TestEvent");
    }

    function request(address addr) public view returns (NewStruct memory target){
        target = structures[addr];
    }

    function remove(address addr) public {
        delete structures[addr];
    }


}