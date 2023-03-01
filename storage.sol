//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * Data location is essetial in solidity
 * beause of data optimization
 *
 * This simple app stores a name
 * and return therstored name
 */

//Data locations - storage, memory and calldata
//storage -- state variable
//memory -- the data is loaded on to memory
//calldata -- just like memory but can only be used as a function input

contract Store {
    string public name;

    //repalcing storage type to calldata is gas efficent
    //i.e it saves more gas
    function set(string calldata _name) external {
        name = _name;
    }

    function get() external view returns (string memory) {
        return name;
    }
}
