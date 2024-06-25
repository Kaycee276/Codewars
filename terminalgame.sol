// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function move(int p, int r) public pure returns (int) {
    // your code here
    
    p += r + r;
    return p;
  }
}