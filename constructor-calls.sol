//SPDX-License-Identifier: MIT

/**
 * This contract will demostrae how to call
 * inherited parents constructors parameters in
 * the child contract
 *
 * and how inherited contracts are executed
 *
 */

pragma solidity ^0.8.7;

//This is the parent contract
contract A {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract B {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//passing a static params in
//the child contract
//param ==> better && lucky
contract C is A("better"), B("lucky") {

}

//passing a dynamic inputs

// order of execution depends on how the chiild
//inherit the parent
// in this case
//1. B
//2. A
//3. W
contract W is B, A {
    constructor(string memory _name, string memory _text) B(_name) A(_text) {
        // code here
    }
}

//passing both static and dynamic inputs

// order of execution depends on how the chiild
//inherit the parent

contract F is A, B("long") {
    constructor(string memory _name) A(_name) {
        // code here
    }
}
