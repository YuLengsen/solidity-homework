// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReverseString {

    function reverse(string memory input) public pure returns (string memory) {
        bytes memory inputBytes = bytes(input);
        uint256 length = inputBytes.length;

        bytes memory reversed = new bytes(length);

        for (uint256 i = 0; i < length; i++) {
            reversed[i] = inputBytes[length - 1 - i];
        }

        return string(reversed);
    }
}
