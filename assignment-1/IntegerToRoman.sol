// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerToRoman {


    function intToRoman(uint256 num) public pure returns (string memory) {
        require(num > 0 && num <= 3999, "Out of range");

        uint256 [13] memory values;
        values[0]  = 1000;
        values[1]  = 900;
        values[2]  = 500;
        values[3]  = 400;
        values[4]  = 100;
        values[5]  = 90;
        values[6]  = 50;
        values[7]  = 40;
        values[8]  = 10;
        values[9]  = 9;
        values[10] = 5;
        values[11] = 4;
        values[12] = 1;


        string [13] memory symbols;
        symbols[0]  = "M";
        symbols[1]  = "CM";
        symbols[2]  = "D";
        symbols[3]  = "CD";
        symbols[4]  = "C";
        symbols[5]  = "XC";
        symbols[6]  = "L";
        symbols[7]  = "XL";
        symbols[8]  = "X";
        symbols[9]  = "IX";
        symbols[10] = "V";
        symbols[11] = "IV";
        symbols[12] = "I";

  
        bytes memory result;

        for (uint256 i = 0; i < values.length; i++) {
            while (num >= values[i]) {
                num -= values[i];
                result = abi.encodePacked(result, symbols[i]);
            }
        }

        return string(result);
    }
}
