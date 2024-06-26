// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function summation(int n) public pure returns (int) {
    // your code here
    require(n > 0, "Input a number greater than zero");

    int answer = 0;

    for (int i = 0; i < n + 1; i++) {
        answer += i;
    }

    return answer;
    
  }
}