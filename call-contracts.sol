//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * contracts can call
 * other contracts functions
 *
 *
 */

contract TestContract {
    uint public x;
    uint public amount = 112;

    //this function set the value of x

    function setX(uint _x) external {
        x = _x;
    }

    //this is a getter fnction
    function getX() external view returns (uint) {
        return x;
    }

    //this function set and receve wei
    function setXAndReceieveWei(uint _x) external payable {
        x = _x;
        amount = msg.value;
    }

    function getXandCheckWeiSent() external view returns (uint, uint) {
        return (x, amount);
    }
}

//accesing contract TestContract

contract Call {
    function setX(TestContract _addy, uint _x) external {
        _addy.setX(_x);
    }

    function getX(address _addy) external view returns (uint) {
        return TestContract(_addy).getX();
    }

    function setXandSendWei(address _addy, uint _x) external payable {
        TestContract(_addy).setXAndReceieveWei{value: msg.value}(_x);
    }

    function getXandValue(
        address _addy
    ) external view returns (uint x, uint value) {
        (x, value) = TestContract(_addy).getXandCheckWeiSent();
        // return(x, value);
    }
}
