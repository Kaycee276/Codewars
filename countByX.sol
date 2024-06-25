// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract CountByX {

  function countBy(uint x, uint n) public pure returns (uint[] memory) {
     // TODO: Your code here
    require (x > 0, "x must be greater than zero");
    require (n > 0, "n must be greater than zero");

    uint[] memory multiples = new uint[](n);
    for (uint i = 0; i < n; i++) {
        multiples[i] = x * (i + 1);
    }

    return multiples;
  }
}