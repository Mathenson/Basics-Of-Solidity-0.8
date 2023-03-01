//SPDX-License-Identifier: MIT

/**
 * when an index of Array is deleted it will restored to zero
 * which is a default value!
 * i.e  [1, 2, 3, 4] == delete[0] ==> [0, 2, 3, 4]
 * shifting an array will solve this issue
 */
pragma solidity ^0.8.7;

contract ShiftArray {
    //A dynamic array
    uint[] public arr;

    //A fixed array of size five index
    uint[5] public arr2;

    //this is a former approach
    function delArray() public {
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        delete arr[6];
    }

    // this will cost us more gas
    function remove(uint _position) public {
        require(_position < arr.length, "out of index");
        //copy array element from R to L
        //starting at the index we removed
        for (uint i = _position; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        //the last step is to pop the last duplicate element
        arr.pop();
    }

    //Testing our function
    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(3);

        //array should look like this
        //[1, 2, 3, 5]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 3);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }

    //More gas efficient but doesnt
    //preserve the order of array
    //replace the element we want to remove with the last element
    //and pop the last element
    function replace(uint _posi) public {
        require(_posi < arr.length, "out of index");
        arr[_posi] = arr[arr.length - 1];
        arr.pop();
    }

    //Testing our function
    function test2() external {
        arr = [1, 2, 3, 4, 5];
        replace(1);

        //array should take this form
        //[1, 5, 3, 4]

        assert(arr[0] == 1);
        assert(arr[1] == 5);
        assert(arr[2] == 3);
        assert(arr[3] == 4);
        assert(arr.length == 4);
    }
}
