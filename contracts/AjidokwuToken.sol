// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20 {
    
    function totalSupply() external view returns(uint);
    function balanceOf(address account) external view returns(uint);
    function transfer(address recipient, uint amount) external returns(bool);
   
    event Transfer(address indexed from, address indexed to, uint amount);
}

contract AjidokwuToken is IERC20 {
    address public owner;
    uint public override totalSupply;
    mapping(address => uint) public override balanceOf;
    string public name = "AJIDOKWU Tokens";
    string public symbol = "aji";
    uint8 public decimals = 18;

 

    constructor() {
        owner = msg.sender;
    }

    function transfer(address recipient, uint _amount) external override returns (bool) {
        uint _charge = (_amount * 10) / 100;
        balanceOf[msg.sender] -= _amount;
        balanceOf[msg.sender] -= _charge;
        balanceOf[recipient] += _amount;
        burn(_charge);

        emit Transfer(msg.sender, recipient, _amount);
        return true;
    }


    function burn(uint amount) private {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

}