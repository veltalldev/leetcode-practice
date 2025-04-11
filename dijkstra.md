# Journey of Discovery: Understanding and Implementing Dijkstra's Algorithm

## Introduction

My journey with Dijkstra's algorithm has been an enlightening experience of discovery, reflection, and eventual mastery. From initial exposure in school to forgetting and re-learning the concept multiple times, I have now arrived at a point where I can derive and implement the algorithm entirely from first principles. This document chronicles the stages of my journey and culminates with the implementation I created based on the understanding I developed.

---

## Stages of the Journey

### 1. **Initial Exposure**

The first time I encountered Dijkstra's algorithm was in school. At that time, I understood it at a surface level—enough to implement it while referencing a textbook. However, I didn't internalize its principles deeply.

### 2. **Forgetting and Rediscovery**

After years without practicing the algorithm, I found myself revisiting it with a more mature perspective. I struggled to recall its details but was determined to re-learn it from scratch, building a deeper understanding.

### 3. **Breaking It Down**

Through exploration, I realized that Dijkstra's algorithm is essentially an optimized version of Breadth-First Search (BFS) that incorporates edge weights. This insight actually stemmed from studying the Bellman-Ford algorithm to solve a negative cycle detection problem. Bellman-Ford, which uses continual edge relaxation, helped me recognize it as a more general version of Dijkstra's algorithm. By focusing on the "boundary of knowledge" and prioritizing nodes dynamically, I developed an intuitive grasp of how it works.

### 4. **Reconstruction from First Principles**

Building on my understanding of BFS, I began with an unoptimized approach I called "BFS with weights." This version involves relaxing edges repeatedly in a BFS-like manner, making multiple passes through the graph until no further improvements can be made. This was a straightforward application of edge relaxation across all nodes, yet it lacked efficiency due to the need for multiple iterations over the entire graph.

However, BFS propagates outward in layers, forming a growing wavefront that explores every reachable node step by step. This propagation can be visualized as a bubble where nodes on the surface boundary are those currently being explored. BFS, in its original form, does so "mindlessly," ignoring edge weights and treating all edges as equal.

By combining this mental image of a boundary with the idea of using cumulative weights to define "distance," I was able to refine the process into a more targeted approach. This refinement involved prioritizing the part of the boundary that was most promising—the node with the least cumulative cost—and using it as the next point of expansion. This insight became the foundation for developing an optimized exploration method.

I conceptualized this optimization as the "Boundary of Knowledge," a mental model for understanding Dijkstra's algorithm. The nodes on the boundary represent the interface between known and unknown regions of the graph—those whose cumulative costs are partially or completely unknown. Among these boundary nodes, one will always have the least cumulative cost from the source, making it the most logical next step for exploration. By processing this node, updating its neighbors, and then removing it from the boundary, the algorithm progressively shifts the boundary outward like an expanding bubble. This bubble does not commit to any one particular direction; if the current path becomes less than ideal, it will abandon the path for a more promising one and potentially return to it in the future.

The process of prioritization ensures that the algorithm expands in the most conservative way possible, choosing the next step that minimizes cost at every turn. This guarantees that the first time the search target is reached, it must be through the shortest path. Similar to BFS, this conservative step-by-step expansion avoids redundant or unnecessary work, ensuring correctness and efficiency. Over time, the boundary grows, and the "known" region of the graph gradually envelops the target node, completing the shortest path discovery.

### Proof of Correctness

The correctness of Dijkstra's algorithm relies on processing nodes in the order of their shortest cumulative distance from the source. This guarantees that, once a node is finalized, no shorter path to it can exist. To demonstrate this, consider the following:

1. **Path Deviation**:
   - If the correct shortest path differs from the proposed path, there must be a point where the paths diverge before reaching the target.
   - At the point of deviation, the boundary of knowledge must cross the correct path. The algorithm will then process the node with the least cumulative distance, steering toward the correct path.

2. **Independent Paths**:
   - If the two paths never merge again before reaching the target, our proposed path would have exceeded the cumulative weight of the correct path at some point (by virtue of not being the correct path).
   - At this point, the algorithm would backtrack and prioritize the correct path due to its lower cumulative cost.

3. **Path Merging**:
   - If the two paths merge prior to the target, then the same consideration applies, only with respect to the point of merging instead of the search target.

By ensuring that the shortest cumulative distance is prioritized at every step, the algorithm guarantees that the first time it reaches the target, it does so through the shortest path.

### 5. **Implementation**

Finally, I implemented the algorithm based purely on my reconstructed understanding, without external references. While the implementation is not fully optimized (e.g., it uses a sorted list instead of a min-heap), it prioritizes correctness and clarity to aid in my endeavor to transform the mental ideas into concrete lines of code.

---

## Final Artifact: Dijkstra's Algorithm Implementation

```dart
// Input
final Map<String, Map<String, int>> graph = {
  'depot': {'A': 5, 'B': 2},
  'A': {'C': 4, 'D': 3},
  'B': {'A': 1, 'D': 6},
  'C': {'dest': 2},
  'D': {'C': 1, 'dest': 8}
};

// Output
final expected = {
  'path': ['depot', 'B', 'A', 'C', 'dest'],
  'distance': 9
};

void main(List<String> args) {
  final actual = dijkstra(graph);
  assert(actual == expected['distance']);
  print("Sample test passed");
}

int dijkstra(Map<String, Map<String, int>> graph) {
  final nodes = graph.keys.toList();
  final knowledgeBoundary = SortedList();

  // initialize
  knowledgeBoundary.insert((nodes[0], 0)); // ('depot', 0)

  while (knowledgeBoundary.isNotEmpty) {
    // process most promising boundary node
    final (nearestNode, distance) = knowledgeBoundary.pop();
    if (nearestNode == 'dest') return distance; // found
    
    // otherwise update new-found neighbors
    final neighbors = graph[nearestNode]!;
    final neighborNodes = neighbors.keys.toList();
    final neighborDistances =
        neighbors.values.map((d) => d + distance).toList();

    final updatedNeighbors = List.generate(neighbors.length, (i) {
      return (neighborNodes[i], neighborDistances[i]);
    });

    // update our records of known nodes
    knowledgeBoundary.putIfAbsentAll(updatedNeighbors);
  }

  return -1; // not found target
}

// use min heap or priority queue instead
class SortedList {
  final List<(String, int)> _list = [];

  void insert((String, int) newValue) {
    _list.add(newValue);
    _list.sort((a, b) {
      return a.$2.compareTo(b.$2);
    });
  }

  (String, int) pop() {
    if (_list.isNotEmpty) {
      return _list.removeAt(0);
    } else
      throw StateError('Cannot pop from empty collection');
  }

  void putIfAbsentAll(List<(String, int)> newNodes) {
    newNodes.forEach((n) {
      putIfAbsent(n);
    });
  }

  void putIfAbsent((String, int) newNode) {
    if (_list.contains(newNode.$1)) {
      update(newNode);
    } else
      insert(newNode);
  }

  void update((String, int) newNode) {
    final (name, value) = newNode;
    for (var i = 0; i < _list.length; i++) {
      final oldNode = _list[i];
      if (oldNode.$1 != name) continue;
      _list.removeAt(i);
      insert(newNode); // add and sort
    }
  }

  bool get isNotEmpty => _list.isNotEmpty;
}
```

---

## Reflection

This journey has been a rewarding experience that reinforced my belief in the value of first-principles thinking. While the implementation can be further optimized, achieving a correct and functional version from scratch is a milestone I take great pride in.

