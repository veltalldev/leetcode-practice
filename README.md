# leetcode-practice
I plan to solve these problems at least on a superficial level just to hone the ability to write code quickly

### [Determine if a Binary Tree is Height-Balanced](20241014)
Given a binary tree, determine whether or not it is height-balanced. A height-balanced binary tree is one in which the heights of the two subtrees of any node never differ by more than one.

---
### [Word Ladder Problem (Transforming Words with BFS)](20240918)
Given two words, `beginWord` and `endWord`, and a dictionary `wordList`, find the length of the shortest transformation sequence from `beginWord` to `endWord`, such that:

---
### [Division of Two Positive Integers Without Division, Multiplication, or Modulus](20240902)
Implement the **division** of two positive integers without using the division (`/`), multiplication (`*`), or modulus (`%`) operators.

---
### [Minimum Brick Cuts in a Wall](20240925)
A wall consists of several rows of bricks of various integer lengths and uniform height. Your goal is to find a vertical line going from the top to the bottom of the wall that **cuts through the fewest number of bricks**. If the line goes through the **edge** between two bricks, this does not count as a cut.

---
### [Implement a Stack API Using Only a Heap](20240904)
**Objective**: Implement a **stack API** using only a **heap**. A stack follows the Last-In-First-Out (LIFO) principle and implements the following methods:

---
### [Check if Two Numbers Add Up to K](20240815)
Given a list of numbers and an integer `k`, write a function that returns whether **any two numbers** from the list add up to `k`.

---
### [Minimum Number of Jumps to Reach the End](20240916)
You are given an array of non-negative integers where each element represents the maximum number of steps that can be jumped forward from that element. Your goal is to find the minimum number of jumps required to reach the last index of the array, starting from the first index.

You can assume that you are always able to reach the last index.

---
### [Runner's Route Optimization](20241008)
A competitive runner would like to create a route that starts and ends at his house, with the condition that the route goes entirely **uphill** at first and then entirely **downhill**.

---
### [House Painting Problem](20241011)
There are `n` houses in a row, each house can be painted with one of `k` colors. The cost of painting each house with a certain color is represented by a 2D list `costs`, where `costs[i][j]` is the cost of painting house `i` with color `j`.

---
### [Binary Tree sum in Range](20241015)
Given a binary search tree (BST) and a range \[a, b\] (inclusive), return the sum of the elements in the tree that fall within this range. The tree structure ensures that for each node, the left subtree contains values less than the node’s value, and the right subtree contains values greater than the node’s value.

---
### [Generate the Power Set of a Set](20240829)
The **power set** of a set is the set of all its subsets, including the empty set and the set itself. Write a function that, given a set, generates its power set.

---
### [Gray Code Generation](20240913)
Generate the sequence of **Gray codes** for a given number of bits `n`. A Gray code is a binary sequence where two successive values differ in only one bit. The task is to generate a list of all `2^n` Gray codes in ascending order, starting from `0`.

---
### [Three Numbers Sum to K](20240909)
Given an array of numbers and a target number `k`, determine if there are **three entries** in the array that sum up to the specified number `k`.

---
### [Trapping Rain Water Problem (Two Pointers)](20240914)
Given `n` non-negative integers representing an elevation map where the width of each bar is `1`, compute how much water it is able to trap after raining.

---
### [Reverse a Singly Linked List](20240922)
Given the head of a singly linked list, reverse the linked list in-place.

---
### [Flatten a Nested Dictionary](20241004)
You are given a dictionary where some values are dictionaries themselves, representing a nested structure. Your task is to flatten the dictionary by concatenating keys at each level, separated by a period (`.`), into a single key.

---
### [Perfect Number Problem](20241007)
A **number** is considered **perfect** if its digits sum up to exactly 10.

---
### [Pathfinding in a Binary Grid (Shortest Path)](20240917)
Given an `m x n` binary grid where `0` represents open land and `1` represents obstacles, find the shortest path from the top-left corner to the bottom-right corner. You can move up, down, left, or right. If no path exists, return -1.

---
### [Depth-First Search and Breadth-First Search for Graph Traversal](20240919)
Given an undirected graph, traverse all nodes starting from a given node using both **DFS** and **BFS** techniques.

---
### [Longest Increasing Subsequence (LIS) Problem](20240901)
Given an array of integers, find the length of the longest subsequence such that all elements of the subsequence are sorted in increasing order. A subsequence is a sequence derived from the original array by deleting some or no elements without changing the order of the remaining elements.

---
### [Partition Equal Subset Sum Problem](20241009)
Given a non-empty array `nums` containing only positive integers, determine if you can partition the array into two subsets such that the sum of elements in both subsets is equal.

---
### [Determine if a 32-bit Integer is a Power of Four](20241002)
Given a 32-bit positive integer `N`, determine whether it is a power of four in faster than **O(log N)** time.

---
### [Smallest Window to Sort](20241003)
Given an array of integers, determine the smallest window (a subarray) that, if sorted, will make the entire array sorted in ascending order. The task is to find the indices of the start and end of this window.

---
### [First Recurring Character](20241013)
Given a string, return the first recurring character in it, or `null` if there is no recurring character.

---
### [Finding Islands in a 2D Grid (BFS for Connected Components)](20240920)
Given a `m x n` 2D grid map of `1`s (land) and `0`s (water), return the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are surrounded by water.

---
### [Most Frequent Subtree Sum](20241005)
Given the root of a binary tree, each node has an associated value. The subtree sum of a node is the sum of all node values in its subtree, including the node itself. Your task is to find the subtree sum that appears most frequently in the tree.

---
### [Dutch National Flag Problem (Sort Colors with Two Pointers)](20240908)
Given an array `nums` with `n` objects colored red, white, or blue, sort them in place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

---
### [Implement a Special Data Structure](20240926)
Implement a data structure that performs the following operations without resizing the underlying array. The structure may allow a low rate of false positives (reporting that an element is present when it is not), but should never return a false negative (reporting that an element is absent when it is actually present).

1. **`add(x)`**: Adds an element `x` to the data structure.
2. **`contains(x)`**: Checks if the element `x` is present in the data structure. It may return `true` if the element is possibly present (even if it's not), but it must return `false` if the element is definitely not present.

The data structure should use a fixed-size underlying array, and no resizing is allowed.

---
### [Container with Most Water (Two Pointers)](20240910)
Given `n` non-negative integers `height` where each represents a point at coordinate `(i, height[i])`, `n` vertical lines are drawn such that the two endpoints of the line `i` are at `(i, 0)` and `(i, height[i])`.

---
### [Maximum Sum of Contiguous Subarray](20240906)
Given an array of numbers, find the **maximum sum** of any contiguous subarray of the array. If all numbers are negative, the maximum sum should be `0`, meaning no elements are taken.

---
### [Target Sum Problem](20241010)
You are given an integer array `nums` and an integer `target`. You want to assign a `+` or `-` sign to each element in the array such that the sum of the elements after assigning the signs equals the `target`. Return the number of different ways you can assign signs to make the sum equal to the target.

---
### [Count Paths in an N by M Matrix](20240827)
You are given an `N x M` matrix filled with zeroes. Write a function to count the number of ways to start at the top-left corner `(0, 0)` and get to the bottom-right corner `(N-1, M-1)`. You can only move **right** or **down** at each step.

---
### [0/1 Knapsack ](20240831)
You are given a set of items, each with a weight and a value. You are also given a knapsack with a maximum weight capacity. Your task is to determine the maximum total value that can be obtained by selecting a subset of items such that the total weight does not exceed the capacity of the knapsack.

Each item can either be taken (1) or not taken (0), hence the name "0/1 Knapsack."
#### Constraints:
- You cannot take a fractional amount of an item.
- You cannot take the same item more than once.

---
### [Balanced Parentheses](20241016)
You are given a string `s` consisting of the characters `(`, `)`, and `*`. The `*` character can represent:
- An opening parenthesis `'('`
- A closing parenthesis `')'`
- An empty string `''`
Determine whether the string `s` can balance its parentheses.

---
### [Find the Nearest K Points](20240824)
Given a list of points, a **central point**, and an integer `k`, write a function to find the **k** nearest points to the central point. The distance between two points is calculated using the **Euclidean distance** formula.

---
### [Generate a Finite but Arbitrarily Large Binary Tree Quickly](20240730)
Implement a function `generate()` that generates a binary tree which is finite but **arbitrarily large**. The function should run in **O(1)** time. The size of the tree must be finite, but unbounded.

---
### [Smallest Set to Cover Intervals](20240915)
You are given a collection of intervals, where each interval is represented as a pair of integers `[start, end]`. Your task is to find the smallest set of points such that each interval contains at least one point from this set.

---
### [Find the Smallest Number of Steps to Reach 1](20240819)
Given a positive integer `N`, find the smallest number of steps it will take to reach `1`.

---
### [Longest Substring Without Repeating Characters](20240912)
Given a string `s`, find the length of the longest substring without repeating characters.

---
### [Airbnb Rounding Problem - Dynamic Programming Solution](20240921)


---
### [Reconstruct Sequence from Comparison Clues](20241012)
The sequence `[0, 1, ..., N]` has been jumbled, and the only clue you have for its order is an array representing whether each number is larger or smaller than the last. Given this information, reconstruct an array that is consistent with it.

---
### [Implement a Queue Using Two Stacks](20240903)
Implement a **queue** using two **stacks**. Recall that a queue is a **FIFO** (First-In, First-Out) data structure with the following methods:

---
### [Run-Length Encoding and Decoding](20240825)
**Run-length encoding** is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count followed by the character.

---
### [Contiguous Subarray with Sum Equal to K](20240911)
Given an array of integers `nums` and an integer `k`, return the total number of continuous subarrays whose sum equals to `k`.

---
### [Partition a Linked List Around a Pivot](20240923)
Given a singly linked list of numbers and a pivot value `k`, partition the linked list such that all nodes with values **less than** `k` come before nodes with values **greater than or equal to** `k`. The relative order of nodes in each partition does not need to be maintained.

---
### [Minimum Cost to Build Houses with Different Colors](20240830)
A builder is looking to build a row of `N` houses that can be painted in `K` different colors. The goal is to **minimize the cost** of painting the houses while ensuring that **no two neighboring houses** are painted the same color.

---
### [Break String into Multiple Lines](20240723)
Given a string `s` and an integer `k`, break up the string into multiple lines such that:

---
### [Implement `rand5()` Using `rand7()`](20240820)
You are given a function `rand7()` that generates a random integer between 1 and 7 (inclusive) with uniform probability. Using this function, implement a new function `rand5()` that generates a random integer between 1 and 5 (inclusive) with uniform probability.

---
### [Rotate Linked List](20241006)
Given the head of a singly linked list and an integer `k`, rotate the list to the right by `k` places. This means moving the last `k` elements to the front of the list while maintaining the order of the other elements.

---
### [Longest Palindromic Subsequence Problem](20241001)
Given a string `s`, find the length of the longest subsequence that is a palindrome. You may delete characters from `s` to form the subsequence, but you cannot rearrange the order of the characters.

---

