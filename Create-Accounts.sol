//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * Call  is a low level function and we 
 * will demosrate how to use it in this contract
 * to call functions in another contracts
 * 
 */

contract Account{
    address public origin;
    address public owner;


    constructor(address _owner) payable {
        origin = msg.sender;
        owner = _owner;
        
    }
}

contract AccountFactory {
    //create an array of accounts
    Account[] public accounts;
    function createAccounts(address _owner) external payable {
        Account account = new Account {value: 200} (_owner);
        accounts.push(account);

    }
}