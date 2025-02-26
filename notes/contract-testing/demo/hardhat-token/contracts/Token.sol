// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Token {

    string public name = "The GBC Token";

    string public symbol = "GBC";

    uint256 public totalSupply = 1000000;

    mapping(address => uint) public balances;
    
    event Transfer(address indexed _from, address indexed _to, uint indexed _amount);
    
    address public owner;
    
    constructor(address _owner) {
        balances[_owner] = totalSupply;
        owner = _owner;
    }
    
    function transfer(address _receiver, uint _amount) external {
        balances[msg.sender] = balances[msg.sender] - _amount;
        balances[_receiver] = balances[_receiver] + _amount;
        emit Transfer(msg.sender, _receiver, _amount);
    }
    
    function balanceOf(address _account) public view returns(uint _balance) {
        _balance = balances[_account];
    }
}