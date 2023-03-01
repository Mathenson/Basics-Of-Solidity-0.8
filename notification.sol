//SPDX-License-Identifier: GPL

pragma solidity ^0.8.7;

/**
 * a simple to-do list
 */

contract Notify {
    struct Notice {
        string noticeName;
        bool done;
    }

    Notice[] public notices;

    function createNotice(string calldata _noticeNAme) external {
        notices.push(Notice({noticeName: _noticeNAme, done: false}));
    }

    function update(uint _index, string calldata _noticeName) external {
        notices[_index].noticeName = _noticeName;
    }

    function getNotice(
        uint _index
    ) external view returns (string memory, bool) {
        Notice storage check = notices[_index];
        return (check.noticeName, check.done);
    }

    function markDone(uint _index) external {
        notices[_index].done = !notices[_index].done;
    }

    function del(uint _index) external {
        delete notices[_index];
    }
}
