// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
   function past(int h, int m, int s) public pure returns (int) {
    // your code here
    require(h < 24, "Hour must be less than 24");
    require(m < 60, "Minute must be less than 60");
    require(s < 60, "seconds must be less than 60");

    int getHoursInMilliseconds = h * 1000 * 60 * 60;
    int getMinutesInMilliseconds = m * 1000 * 60;
    int getSecondsInMilliseconds = s * 1000 ;

    int totalMilliSeconds = getHoursInMilliseconds + getMinutesInMilliseconds + getSecondsInMilliseconds;

    return totalMilliSeconds;
    
  }
}
