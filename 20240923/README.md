### Problem: Partition a Linked List Around a Pivot

Given a singly linked list of numbers and a pivot value `k`, partition the linked list such that all nodes with values **less than** `k` come before nodes with values **greater than or equal to** `k`. The relative order of nodes in each partition does not need to be maintained.

#### Example:
**Input:**  
- Linked list: `5 -> 1 -> 8 -> 0 -> 3`
- Pivot: `k = 3`

**Output:**  
- One possible solution: `1 -> 0 -> 5 -> 8 -> 3`

#### Constraints:
- The linked list may contain zero or more elements.
- You should not create new nodes, only rearrange the existing nodes in the list.
