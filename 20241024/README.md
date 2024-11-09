# Longest Path in Weighted Tree

## Problem Description
Given a tree where each edge has a weight, compute the length of the longest path in the tree. 

A path can travel through any sequence of connected nodes in the tree, and its length is the sum of the weights of all edges traversed. The path does not need to pass through the root node.

### Constraints
- Each node can have any number of children
- Edge weights must be non-negative
- A path must be simple (cannot visit the same node twice)
- The path does not need to go through the root
- The tree is guaranteed to be acyclic

### Example
Given the following tree structure:
```
   a
  /|\
 b c d
    / \
   e   f
  / \
 g   h
```

With weights:
- a-b: 3
- a-c: 5
- a-d: 8
- d-e: 2
- d-f: 4
- e-g: 1
- e-h: 1

The longest path would be `c -> a -> d -> f`, with a total length of 17.

## Approach
1. Observe that we only need the length, not the actual path
2. Use bottom-up recursion to collect state from leaf nodes
3. At each node, maintain two values:
   - TO-PARENT: maximum path length ending at current node
   - THROUGH-PARENT: maximum path length passing through current node
4. Compare and propagate maximum lengths upward

## Complexity
- Time: O(n) where n is the number of nodes
- Space: O(h) where h is the height of the tree for recursion stack
- Additional space: O(k) per recursive level where k is the branching factor at that level

## Test Cases
1. Single node tree (base case)
2. Unival tree (all weights = 1)
3. Tie break with ascending vs descending weights
4. Large weight at bottom level
5. Original example tree

## Implementation Notes
- Uses bottom-up recursion
- Maintains parallel arrays for children and weights in TreeNode
- Each recursive call returns (maxTo, maxThrough) tuple
- Assumes non-negative weights to maintain invariant that longest path must connect leaf nodes