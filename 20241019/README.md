### Problem Statement

You are given a network consisting of nodes labeled from `0` to `N`. The network is represented by a list of edges `(a, b, t)`, where:
- `a` and `b` are nodes,
- `t` is the time it takes for a message to travel from node `a` to node `b`.

Whenever a node receives a message, it immediately passes the message to neighboring nodes, if possible. Your task is to determine how long it will take for every node to receive a message that starts at node `0`.

#### Assumptions:
- The network is connected, meaning there is a path between any pair of nodes.

#### Example

Given `N = 5` and the following edges:

    edges = [
        (0, 1, 5),
        (0, 2, 3),
        (0, 5, 4),
        (1, 3, 8),
        (2, 3, 1),
        (3, 5, 10),
        (3, 4, 5)
    ]

You should return `9`, because the slowest propagation occurs along the path `0 -> 2 -> 3 -> 4`, which takes 9 units of time.

