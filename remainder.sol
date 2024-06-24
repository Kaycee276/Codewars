// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function checkForFactor(int base, int factor) public pure returns (bool) {
    bool boolean;
    boolean = base % factor == 0 ? true : false;
    return boolean;
  }
}