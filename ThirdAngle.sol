// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract ThirdAngle {
  function otherAngle(uint angle1, uint angle2) public pure returns (uint) {
    // TODO your code here
    uint a1 = angle1;
    uint a2 = angle2;
    
    uint two_thirds = a1 + a2;

    uint thirdAngle = 180 - (two_thirds);
    
    return thirdAngle;
  }
}
