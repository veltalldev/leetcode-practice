# Longest Increasing Subsequence (LIS) Problem

## Problem Statement:
Given an array of integers, find the length of the longest subsequence such that all elements of the subsequence are sorted in increasing order. A subsequence is a sequence derived from the original array by deleting some or no elements without changing the order of the remaining elements.

## Input:
- An array `A[1 ... n]` of `n` integers.

## Output:
- The length of the longest increasing subsequence of `A`.
- Bonus: the actual sequence itself as an ordered list.

## Example:

1. **Input**: `A = [10, 9, 2, 5, 3, 7, 101, 18]`
   - **Output**: `4` (The longest increasing subsequence is `[2, 3, 7, 101]`)

2. **Input**: `A = [0, 1, 0, 3, 2, 3]`
   - **Output**: `4` (The longest increasing subsequence is `[0, 1, 2, 3]`)

## Constraints:
- The array `A` can contain up to `n` integers.
- The elements of `A` can be positive, negative, or zero.
- A subsequence is different from a subarray, as elements in a subsequence do not have to be contiguous.

## Objective:
Find the length of the longest increasing subsequence. The elements in the subsequence should maintain their relative positions as they appear in the original array, and they should be in strictly increasing order.
