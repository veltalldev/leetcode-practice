import 'dart:collection';

void bfsCountSteps(Map<int, List<int>> graph, int startNode) {
  Queue<int> queue = Queue<int>();
  Set<int> visited = {}; // Keep track of visited nodes
  queue.add(startNode);
  visited.add(startNode);

  int steps = 0; // Number of BFS steps (levels)

  while (queue.isNotEmpty) {
    int levelSize = queue.length; // Number of nodes at current level

    for (int i = 0; i < levelSize; i++) {
      int node = queue.removeFirst();

      // Process the node here (if needed)
      print('Visiting node $node at step $steps');

      // Add all unvisited neighbors
      for (int neighbor in graph[node] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }

    // After processing the current level, increment step count
    steps++;
  }

  print('Total BFS steps (levels): $steps');
}

void main() {
  // Example graph (adjacency list)
  Map<int, List<int>> graph = {
    0: [1, 2],
    1: [3],
    2: [4],
    3: [],
    4: [5],
    5: []
  };

  bfsCountSteps(graph, 0); // Start BFS from node 0
}
