// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MergeSortedArray {

    function merge(
        uint256[] memory a,
        uint256[] memory b
    ) public pure returns (uint256[] memory) {

        uint256 lenA = a.length;
        uint256 lenB = b.length;

        uint256[] memory result = new uint256[](lenA + lenB);

        uint256 i = 0; 
        uint256 j = 0; 
        uint256 k = 0; 

        while (i < lenA && j < lenB) {
            if (a[i] <= b[j]) {
                result[k] = a[i];
                i++;
            } else {
                result[k] = b[j];
                j++;
            }
            k++;
        }


        while (i < lenA) {
            result[k] = a[i];
            i++;
            k++;
        }


        while (j < lenB) {
            result[k] = b[j];
            j++;
            k++;
        }

        return result;
    }
}
