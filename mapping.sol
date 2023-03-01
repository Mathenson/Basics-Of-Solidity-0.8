//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * @title iterating Mapping
 * @author mathenson
 * @notice this contract will demostrate how we
 *          can iterate through mapping.
 *
 */

contract Map {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    //an array of addresses
    address[] public addresses;

    function iterateM(address _address, uint _amount) external {
        //check that address is not already inserted in the array
        // require(!inserted[_address], "Already inserted");
        //map address to amount
        balances[_address] = _amount;
        if (!inserted[_address]) {
            inserted[_address] = true;
            addresses.push(_address);
        } else {
            //increment the amount passed
            balances[_address] += _amount;
        }
    }

    //get the length of the array
    function getlen() external view returns (uint) {
        return addresses.length;
    }

    //get the amout of  last element
    function lastE() external view returns (uint) {
        return balances[addresses[addresses.length - 1]];
    }

    // get an nth amount
    function nth(uint _nth) external view returns (uint) {
        return balances[addresses[_nth]];
    }
}

// contract mapIt {
//     mapping(address => uint) public x;
//     mapping (address => bool) public y;

// //this stores the array of zi respt.
//     address[] public zi;

//     function itmap(address _q, uint _p ) external {
//         x[_q] = _p;
//         if (!y[_q]) {
//            y[_q] = true;
//             zi.push(_q);
//         } else {
//             x[_q] += _p;
//         }
//     }
// }
