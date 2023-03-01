//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
    Visibility
    //private ==> can only be accessed inside contract
    //internal ==> can only be accesed inside contract and child 
    //public ==> can be accessed inside and outside contract
    //external ==> can only be accessed outside contract

*/

contract parentVisible {
    //States Variable
    uint private x;
    uint internal y;
    uint public z;

    // eternal varibles can not be defiend
    //uint external a;

    //this function can only be accesced inside this contract
    function privateFunc() private pure returns (uint) {
        return 10;
    }

    //this function can only be accessed insie the contract
    //and the child
    function internalFunc(uint _t) internal pure returns (uint) {
        return _t;
    }

    //this function can be accessed everywhere
    function publicFunc() public pure returns (uint) {
        return 202;
    }

    //this function can be accessed only by external contracts
    function externalFunc() external pure returns (uint) {
        return 1000;
    }

    //use this function for test
    function test() external view {
        x + y + z;

        privateFunc();
        internalFunc(6);
        // external function cant be accessed / called
        //externalFunc();
        publicFunc();
    }
}

// child contract

contract childVisible is parentVisible {
    function test2() external view {
        y + z;

        internalFunc(2);
        publicFunc();
    }
}
