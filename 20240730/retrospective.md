## 07/31/24

- After encountering massive difficulties in adjusting the nodes of an implicit BST to maintain two properties simultaneously after a node removal: 

    - the congruity of the foundational data array 
    - the correctness of the BST hierarchy

  I'm beginning to think that an implicit BST is not feasible, or at least not practical. The lack of a null pointer requires every node slot to be filled, which means the entire remainder of the tree (to the right of the removal node) needs to be rotated over to fill in the slot. In an analogy, the hole left behind after the removal needs to "bubble up" until it can "bubble down" so that it reaches the last index of the array.

- Even if such a removal method can be achieved, adding a node to the tree will require a similar kind of adjustment to maintain BST correctness.