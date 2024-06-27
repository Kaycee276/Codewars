// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract HelloWorld {
  // State Variables
  string greeting = "Hello World!"; // Change this
  
  // Endpoints
  
  function setGreeting(string memory _greet)public {
    greeting = _greet;
  }
  
  function greet() public view returns(string memory){
    return greeting;
  }
  // ...
}