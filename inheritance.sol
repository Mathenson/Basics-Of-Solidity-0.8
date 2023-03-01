//SPDX-License-Identifier: MIT
/**
 * This contract will demostrate how we can
 * call contracts from contracts
 * note: the virtual and the override keyword
 */

pragma solidity ^0.8.7;

//in order to allow other contracts to inherit the functions of this contract we will add
//the virtual keyword to the functions to be overriden
contract A {
    function start() public pure virtual returns (string memory) {
        return "start";
    }

    function second() public pure virtual returns (uint) {
        return 100;
    }
}

// to override the function of A
// we need to add the override keyword to the function

//to allow functions of contract to inherited
//we add the virtual keyword
contract B is A {
    function start() public pure virtual override returns (string memory) {
        return "Modify";
    }

    function second() public pure virtual override returns (uint) {
        return 200;
    }

    function end(string calldata _end) public pure returns (string memory) {
        return (_end);
    }
}

//overriding more than one contract
//when inheriting contracts from multiple contracts
// we start with the most based contract to be derived
// and add the contract inherited to the functions
contract C is A, B {
    function start() public pure override(A, B) returns (string memory) {
        return "Changes";
    }

    function second() public pure override(B, A) returns (uint) {
        return 300;
    }

    function self() public pure returns (string memory) {
        return "selfFunction";
    }
}
