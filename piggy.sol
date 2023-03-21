////SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Savings {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address public owner = msg.sender;

    //receive funds from anyine
    receive() external payable {
        emit Deposit(msg.value);
    }

    function Withdrawal() external {
        require(msg.sender == owner, "unauthorized");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
