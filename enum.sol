//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * Enums are used in changing state and conditions
 * we are not restricted by the bool (0 or 1)
 */

contract Enums {
    enum Update {
        None,
        Preparing,
        Packaging,
        Sending,
        Delivered
    }

    //enums can be declared as a state variable
    Update public update;

    //setting enums
    function set(Update _condition) external {
        update = _condition;
    }

    //getting update
    function get() external view returns (Update) {
        return update;
    }

    //restore enums
    function del() external {
        delete update;
    }
}
