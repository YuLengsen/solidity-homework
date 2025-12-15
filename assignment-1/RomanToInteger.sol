// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RomanToInteger {

    function romanToInt(string memory s) public pure returns (uint256) {
        bytes memory b = bytes(s);
        uint256 result = 0;
        uint256 prev = 0;

        for (uint256 i = b.length; i > 0; i--) {
            uint256 curr = romanCharValue(b[i - 1]);

            if (curr < prev) {
                result -= curr;
            } else {
                result += curr;
            }

            prev = curr;
        }

        return result;
    }

    function romanCharValue(bytes1 c) internal pure returns (uint256) {
        if (c == "I") return 1;
        if (c == "V") return 5;
        if (c == "X") return 10;
        if (c == "L") return 50;
        if (c == "C") return 100;
        if (c == "D") return 500;
        if (c == "M") return 1000;
        return 0;
    }
}
