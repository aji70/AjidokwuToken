// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AjidokwuTokens {
    uint private totalSupply;
    mapping(address => uint) private balances;
    mapping(address => mapping(address => uint)) public allowance;
    string public name;
    string public symbol;
    uint8 public decimals;
    address  owner = msg.sender;
	event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    
constructor(){
     name = "Ajidokwu Tokens";
     symbol = "AJI";
     decimals = 18;
     owner = msg.sender;
    _mint(1000000);
    }
    

    function transfer(address recipient, uint amount) external returns (bool) {
        require(recipient != address(0), "Cannot transfer to address 0");
        uint _charge = (amount * 10) / 100;
        require((balances[msg.sender] + _charge) >= amount, "You do not have sufficient funds to send");
        burn(_charge);
        balances[msg.sender] -= amount;
        balances[msg.sender] -= _charge;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        require(spender != address(0), "Cannot approve  address 0");
        uint _charge = (amount * 10) / 100;
        require((balances[spender] + _charge > 0), "spender does not have sufficient funds for transfer");
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        uint _charge = (amount * 10) / 100;
        require((balances[sender] + _charge > 0), "spender does not have sufficient funds for transfer");
        require(allowance[sender][msg.sender]  > amount, "You do not have sufficient allowance to send");
        allowance[sender][msg.sender] -= amount;
        balances[msg.sender] -= _charge;
        balances[sender] -= amount;
        burn(_charge);
        balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function _mint(uint amount) internal {
        require(msg.sender == owner, "Only owner can mint");
        balances[owner] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) private {
        require(amount > 0, "cannot burn nothing");
        require(balances[msg.sender] >= amount, "You do not have enough tokens to burn");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
