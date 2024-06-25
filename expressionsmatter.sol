// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function expressionMatter(int a, int b, int c) public pure returns (int) {
    // your code here
    
    int[8] memory allCombo = [a+(b*c), (a+b)*c, (a*b)+c, a*(b+c), a*b*c, a+b+c, a+b*c, a*b+c];

    int result = allCombo[0];

    for (uint i = 0; i < allCombo.length; i++) {
       if(allCombo[i] > result) {
        result = allCombo[i];
       } 
    }

    return result;
   
  }
}