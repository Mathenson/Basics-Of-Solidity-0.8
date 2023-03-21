//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

/**
 *  this is a self destruct contract that
 * got destroyed on the blockchain when being called
 * the helper function will call its address and get all the funds
 * inside the contract
 */

contract Destrut {
    //to receive funds
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    //when self destruct is called the function
    //inside it can not be called again
    //this function will not xist again
    function calc() external pure returns (uint) {
        return 900;
    }
}

//this contract call the self destruct contract and receive all the
//funds inside it

contract Killer {
    function call(Destrut _destruct) external {
        _destruct.kill();
    }

    //get balance
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
