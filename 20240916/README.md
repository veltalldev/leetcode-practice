# Minimum Number of Jumps to Reach the End

## Problem Definition

### Objective
Given an array of non-negative integers, where each element represents the maximum number of steps that can be jumped forward from that element, determine the **minimum number of jumps** required to reach the last element of the array starting from the first element.

### Example

Consider the following array:

`[6, 2, 4, 0, 5, 1, 1, 4, 2, 9]`

The minimum number of jumps required to reach the last element is **2**. The optimal path is:
- Jump from the first element (`6`) to the fifth element (`5`), and then
- Jump from the fifth element (`5`) to the last element (`9`).

### Notes
- You are guaranteed that it is always possible to reach the end of the array.
- The goal is to minimize the number of jumps required.
- The input is a non-empty array of integers where each integer represents the maximum jump length from that position.
- The function should return the minimum number of jumps needed to reach the last element from the first.
