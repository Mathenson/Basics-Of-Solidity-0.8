//SPDX-License-Identifier: MIT

//This is a very simple contract that shows how
//variables can be incremented and decremented
//with some numbers in our case 10

pragma solidity ^0.8.7;

contract counter {
    //declaring a state variable
    uint public count;

    function increment() external {
        count += 10;
    }

    function decrement() external {
        count -= 10;
    }
}
