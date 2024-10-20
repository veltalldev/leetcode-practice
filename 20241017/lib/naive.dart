/// 20241016
import "dart:collection";

int? minMovesToUnlock(List<int> target, Set<List<int>> deadEnds) {
  /// simple BFS search for shortest path to combination
  /// with added membership check for special configs
  if (listEquals(target, <int>[0, 0, 0])) {
    return 0;
  }
  int attempts = 0;
  Queue<List<int>> queue = Queue<List<int>>();
  final visited = <List<int>>{};
  queue.add([0, 0, 0]);
  while (queue.isNotEmpty) {
    final current = queue.removeFirst();
    print("presently processing $current");
    if (listEquals(current, target)) return ++attempts;
    visited.add(current);

    // processing and updating neighbors
    final neighbors = <List<int>>[];
    for (int i = 0; i < current.length; i++) {
      final List<int> config1 = List.from(current);
      final List<int> config2 = List.from(current);
      config1[i] += 1;
      neighbors.add(config1);
      config2[i] -= 1;
      if (config2[i] < 0) config2[i] += 10;
      neighbors.add(config2);
    }
//    print("Neighbors before filter: $neighbors");
    // neighbors are full now, check against blacklist
    final validNeighbors = neighbors
        .where((n) => !deadEnds.contains(n))
        .where((n) => !visited.contains(n));
    //  print("Neighbors after filter: $neighbors");
    queue.addAll(validNeighbors);
    attempts++;
  }

  // queue is empty, cannot reach target config
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
  // test example
  final target = [0, 0, 1];
  final deadEnds = <List<int>>{};

  var minSteps = minMovesToUnlock(target, deadEnds);
  print("min steps to reach $target: $minSteps");
}
