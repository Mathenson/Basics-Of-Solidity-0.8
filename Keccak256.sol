//SPDX-License-Identifier: MIT

/**
 * Keccack is a widely used cryptographic hash
 * function in solidity
 */

pragma solidity ^0.8.7;

contract Hash {
    //this hash the input params
    function hashFunc(
        string memory text,
        uint num,
        address addy
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addy));
    }

    //encode dislay all the bytes memory
    function encode(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    //encode display bytes in  packed form
    function encodePacked(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    //collision occurs when the inputs params are being manipulated and it output
    //the same bytes of data
    function collision(
        string memory text0,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encode(text0, text1));
    }

    //it is fixed by inserting other data types in the params
    function collison3(
        string memory text0,
        uint num1,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encode(text0, num1, text1));
    }
}
