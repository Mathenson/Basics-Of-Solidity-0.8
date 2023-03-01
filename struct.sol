//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/**
 * @title Struct
 * @author mathenson
 * @notice memory is not available when the function is called
 *         Storage variable is stored in the smart contract and can e modified
 */

contract Structs {
    //defining struct
    struct User {
        string fullName;
        uint score;
        string sex;
    }

    //an object variable
    User public user;

    //an array
    User[] public users;

    //ways to initialize structs
    function init() external {
        //1st way to init
        User memory A = User("Mathenson", 200, "Male");
        User memory B = User("Billy", 244, "Female");
        User memory C = User("Pristen", 190, "Male");

        //2nd way to init
        User memory D;
        D.fullName = "Seagal";
        D.score = 90;
        D.sex = "Male";

        //push 1 and 2 into array
        users.push(A);
        users.push(B);
        users.push(C);

        //3
        users.push(User("Fren", 100, "Female"));
    }

    //non hardcoded
    //input details

    function addMem(
        string memory _sname,
        uint _score,
        string memory _sex
    ) external {
        User memory details = User(_sname, _score, _sex);
        users.push(details);
    }
}
