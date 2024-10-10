import 'package:collection/collection.dart';

/// 20241008
/// This appears to be a problem for Dijkstra's algorithm, but with an
/// additional constraint applied.
/// The uphill-then-downhill condition (henceforth referred to as the
/// UD condition) narrows the search by pruning uphill options once a
/// downhill option has been chosen.
///
/// I plan to implement two solutions for this. While they are identical in
/// logic, one of them will make use of a generic Dijkstra's algorithm and
/// provide the custom data structure and search condition to it.

typedef Route = (int destination, int cumulativeDistance, bool isUphill);
typedef Neighbor = (int neighborNode, int distanceToNeighbor);
typedef Path = (int origin, int destination);

int findShortestRunnerRoute(
  Map<int, int> elevations,
  Map<Path, int> pathDistances,
) {
  // ========================================================
  // initializations
  final queue = PriorityQueue<Route>((routeA, routeB) {
    final (nodeA, distanceA, _) = routeA;
    final (nodeB, distanceB, _) = routeB;
    return distanceA.compareTo(distanceB);
  });
  final visitedSet = <int>{};
  final cumulativeDistances = <int, int>{};
  final arbitraryLargeValue = 1e9.toInt();
  for (var key in elevations.keys) {
    cumulativeDistances[key] = arbitraryLargeValue;
  }
  // ***********************
  bool isUphill = true;

  // different ways to leave home
  // find only uphill routes
  final firstNode = 0;
  final firstUphillNeighbors = findNeighborsOf(
    pathDistances,
    firstNode,
    elevations,
    uphillFilter,
  );

  // generating routes with corresponding distances
  final List<Route> firstUphillRoutes = firstUphillNeighbors.map((neighbor) {
    final destination = neighbor.$1;
    final distance = neighbor.$2;
    return (destination, distance, isUphill);
  }).toList();

  // all routes in a single list to be processed
  final firstRoutes = [...firstUphillRoutes];

  // update cumulative distances for first routes
  // route = (neighbor node, cumulative distance)
  for (var route in firstRoutes) {
    final (neighborNode, cumulativeDistance, _) = route;
    if (cumulativeDistance < cumulativeDistances[neighborNode]!) {
      cumulativeDistances[neighborNode] = cumulativeDistance;
    }
  }

  // initialize queue with initial options
  queue.addAll(firstRoutes);

  // =====================================================
  // Dijkstra's loop
  while (queue.isNotEmpty) {
    // process the next route
    // route = (current node, current cumulative distance)
    final (currentNode, currentDistance, uphillState) = queue.removeFirst();

    if (visitedSet.contains(currentNode)) {
      continue;
    }
    visitedSet.add(currentNode);
    // neighbors are (neighbor nodes, distance from current node)
    var currentUphillNeighbors = <(int, int)>[];
    if (uphillState == true) {
      currentUphillNeighbors = findNeighborsOf(
        pathDistances,
        currentNode,
        elevations,
        uphillFilter,
      );
    }
    final currentDownhillNeighbors = findNeighborsOf(
      pathDistances,
      currentNode,
      elevations,
      downhillFilter,
    );

    final nextRoutes = calculateNextRoutes(
      currentUphillNeighbors,
      currentDownhillNeighbors,
      currentDistance,
    );

    // update min distances now that route information is available
    for (var route in nextRoutes) {
      final (destination, cumulativeDistance, _) = route;
      if (cumulativeDistances[destination]! > cumulativeDistance) {
        cumulativeDistances[destination] = cumulativeDistance;
        queue.add(route);
      }
    }
  }

  // minimum cumulative distance to 0
  return cumulativeDistances[0]!;
}

bool uphillFilter(int currentElevation, int neighborElevation) {
  return currentElevation <= neighborElevation;
}

bool downhillFilter(int currentElevation, int neighborElevation) {
  return currentElevation >= neighborElevation;
}

// return a list of (neighbor, distance) pairs
// distance only goes from current node to neighbors
List<(int, int)> findNeighborsOf(
  Map<(int, int), int> pathDistances,
  int currentNode,
  Map<int, int> elevations,
  bool Function(int currentElevation, int neighborElevation) neighborFilter,
) {
  return pathDistances.keys
      .where((key) => key.$1 == currentNode)
      .where((key) {
        final neighborNode = key.$2;
        final currentElevation = elevations[currentNode]!;
        final neighborElevation = elevations[neighborNode]!;
        return neighborFilter(currentElevation, neighborElevation);
      })
      .map((key) => (key.$2, pathDistances[key]!))
      .toList();
}

// combine uphill and downhill neighbor lists into a single route list
List<Route> calculateNextRoutes(
  List<(int, int)> uphillNeighbors,
  List<(int, int)> downhillNeighbors,
  int currentDistance,
) {
  final isGoingUphill = true;

  final uphillRoutes = uphillNeighbors.map((neighbor) {
    final destination = neighbor.$1;
    final distance = neighbor.$2;
    return (destination, currentDistance + distance, isGoingUphill);
  }).toList();
  final downhillRoutes = downhillNeighbors.map((neighbor) {
    final destination = neighbor.$1;
    final distance = neighbor.$2;
    return (destination, currentDistance + distance, !isGoingUphill);
  }).toList();

  return [...uphillRoutes, ...downhillRoutes];
}
