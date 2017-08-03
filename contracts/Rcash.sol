pragma solidity ^0.4.4;

contract Rcash {
	uint public totalBalance;
	mapping(address => uint) balances;
	address owner;
	event Send(address from, address to, uint amount);
	event Buy(address from, uint amount);
	function Rcash() {
		totalBalance=1000;
		owner=msg.sender;
	}

	function send(address to, uint amount) returns(uint){
		balances[msg.sender] = balances[msg.sender]-amount;
		balances[to] = balances[to]+amount;
		Send(msg.sender,to,amount);
		return balances[msg.sender];
	}

	function buy(uint amount) returns(uint) {
		balances[msg.sender] = balances[msg.sender]+amount;
		totalBalance = totalBalance-amount;
		Buy(msg.sender,amount);
		return balances[msg.sender];
	}


	function getBalance(address addr) constant returns(uint) {
		return balances[addr];
	}

}
