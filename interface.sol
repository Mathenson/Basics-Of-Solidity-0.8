//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * @title Interfaces
 * @author Mathenson
 * @notice note the I initials for interface
 *
 * interfaces allow us to call and interact with contracts
 * without having the code
 *
 * in this cotract we will interact with the counter.sol contract
 * please deploy the counter.sol and copy its contract address
 */

interface Icounter {
    function count() external view returns (uint);

    function increment() external;
    
    function decrement() external;
}

contract callInterface {
    uint public count;

    function increInterface(address _counter) external {
        Icounter(_counter).increment();
        count = Icounter(_counter).count();
    }

    function decreInterface(address _counter) external {
        Icounter(_counter).decrement();
        count = Icounter(_counter).count();
    }
}
