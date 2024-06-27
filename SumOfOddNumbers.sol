// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function rowSumOddNumbers(int n) public pure returns (int) {
    // your code here
    require(n > 0, "Input a number greater than zero");
    
    int firstNumber = n * n - (n - 1);
    int sum = 0;

    for (int i = 0; i < n; i++){
      sum += firstNumber + 2 *i;
    }

    return  sum;

  }
}