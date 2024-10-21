/// 20241016
/// very textbook BFS problem
import "dart:collection";

int? minMovesToUnlock(List<int> target, Set<String> deadEnds) {
  /// simple BFS search for shortest path to combination
  /// with added membership check for special configs
  final configLength = target.length;
  final initialConfig = List.filled(configLength, 0);

  if (listEquals(target, initialConfig)) {
    return 0;
  }
  if (deadEnds.contains(target.join(''))) return null;

  Queue<List<int>> queue = Queue<List<int>>();
  final visited =
      <String>{}; // convert to string representation for ease of membership checking
  queue.add(initialConfig);

  int steps = 0; // Tracks the number of BFS levels (steps)

  while (queue.isNotEmpty) {
    int levelSize = queue.length; // Number of elements at the current level

    for (int i = 0; i < levelSize; i++) {
      final current = queue.removeFirst();
      if (listEquals(current, target)) {
        return steps; // Return the number of steps when target is found
      }

      visited.add(current.join(''));

      // Processing and updating neighbors
      final neighbors = <List<int>>[];
      for (int j = 0; j < current.length; j++) {
        final List<int> config1 = List.from(current);
        final List<int> config2 = List.from(current);

        // Move digit up
        config1[j] = (config1[j] + 1) % 10;

        // Move digit down
        config2[j] = (config2[j] - 1 + 10) % 10;

        neighbors.add(config1);
        neighbors.add(config2);
      }

      // Neighbors are full now, check against blacklist
      final validNeighbors = neighbors.where((n) =>
          !deadEnds.contains(n.join('')) && !visited.contains(n.join('')));

      queue.addAll(validNeighbors);
    }

    steps++; // After processing the current level, increment steps
  }

  // Queue is empty, cannot reach target config
  return null;
}

bool listEquals(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}

void main() {
  // Test example
  final target = [0, 0, 8];
  final deadEnds = <String>{
    "009",
  };

  var minSteps = minMovesToUnlock(target, deadEnds);
  print("Min steps to reach $target: $minSteps");
}
