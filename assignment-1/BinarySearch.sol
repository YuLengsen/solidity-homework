// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BinarySearch {

    function binarySearch(
        uint256[] memory nums,
        uint256 target
    ) public pure returns (int256) {

        if (nums.length == 0) {
            return -1;
        }

        uint256 left = 0;
        uint256 right = nums.length - 1;

        while (left <= right) {
            uint256 mid = left + (right - left) / 2;

            if (nums[mid] == target) {
                return int256(mid);
            }

            if (nums[mid] < target) {
                left = mid + 1;
            } else {
                if (mid == 0) {
                    break; 
                }
                right = mid - 1;
            }
        }

        return -1;
    }
}
