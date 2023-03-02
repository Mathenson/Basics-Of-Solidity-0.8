//SPDX-License-Identifier: MIT

/**
 * @title Send and receive Ether
 * @author Mathenson
 * 
 * The payable function give right for
 * a function to transfer ether 
 * 
 * the receive function and fallback function
 * allows contract to receive ether from a contract or 
 * Externally Owned Address
 * 
 * the differnece between fallback and receive
 * 
/**

    Ether is sent to the contract
                |
        is msg.data empty ?
              /  \
            yes  no
           /       \
receive() exists?    fallbak()
        /    \
      yes    no
      /        \
receive()       fallback()

 * 
 * 
 */

pragma solidity ^0.8.7;

contract EtherWallet {
    //declare a state variable
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    //we can also apply a fallback function to revert
    //uninitialized functions in the contract and to make it receive ethers
    fallback() external payable {}

    //to be able to receive ether
    receive() external payable {}

    //function to withdraw ether to owner account
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "unauthorized");
        //payable(owner).transfer(_amount);
        payable(msg.sender).transfer(_amount); //gas efficeint
    }

    //send ethers to an external contract
    function sendEther(address payable _to, uint _amount) external payable {
        require(msg.sender == owner, "Unauthoized");
        bool sent = _to.send(_amount);
        require(sent, "failed");
    }
}

//send ethers to this wallet
