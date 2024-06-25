// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Repeater {
  function multiply(uint8 repeat, string memory pattern) public pure returns (string memory) {
    if(repeat == 0){
      return "";
    }
    
    bytes memory repeatedString;
    
    for(uint i = 0; i < repeat; i++){
      repeatedString = abi.encodePacked(repeatedString, pattern);
    }
    
    return string(repeatedString );
  }
}