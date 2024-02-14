//Mention the differences between Hardhat and Truffle

//ans= hardhat = Faster migration support
//Less gas fees during migration
//Debugging is easy
//truffle= slower migration support as compare to hardhat
//more gas fees require during migration
//debbuing is hard

//ans 2 =  Write a Smart Contract and demonstrate the steps
//involved in the process of compilation using Hardhat

//SPDX-LICENSE Identifire : MIT;

Pragma solidity ^0.8.23;

contract Token {

    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    // the fixed amount of token , stored in an unsinged integer type variable
    uint256 public totalsupply = 1000000;

    //an adress type variable is used to store each account's balance.
    address public owner;

    //mapping is a key/value map. here we store each account'balance

    mapping(address => uint256) balances;

    //the transfer event helps off-chain applicatin understand
    //what happens within your contract
    event Transfer(address indexed _from, adress indexed _to, uint256 _value);

    constructor() {

        //the totalsupply is assigned to the transaction sender,which is the
        //account that is deploying the contract
        balances[msg.sender] = totalsupply;
        owner = msg.sender;
    }

    function transfer(address to , uint256 amount) external {
        //chek if the transaction sender has enouf token

        require(balances[msg.sender] >= amount, "not enough token");

        //tranfer the amount
        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to , amount);
    }

    function balanceof(address account) external view returns (uint256) {
        return balance[account];
    }
    // token.sol
    // compiling amart contract 
    // $npx hardhat compile 
    //compiling two file lock.sol and token.sol
}