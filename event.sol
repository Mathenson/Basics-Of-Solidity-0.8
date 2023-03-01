//SPDX-License-Identifier: MIT

/**
 * @title Events
 * @author Mathenson
 * @notice the indexed keyword is used to search an
 *          an event by the parameter that was logged
 *
 * evets allow us to write data on the blockchain
 * and to verify something happens or changes made
 */

pragma solidity ^0.8.7;

contract Events {
    //event to store data on the blockchain
    event Log(string message, uint val);

    function saveOn() external {
        emit Log("lane", 200);
    }

    //event to send anyone some wei ad to verify on the blockchain
    event sendWei(address indexed from, address indexed _to, uint _value);

    function SendWei(address _to, uint _value) external {
        emit sendWei(msg.sender, _to, _value);
    }

    //Event to send a mssage
    event sendMessage(
        address indexed from,
        address indexed _to,
        string _message
    );

    function sMessage(address _to, string calldata _message) external {
        emit sendMessage(msg.sender, _to, _message);
    }
}
