import 'dart:math';
import 'package:collection/collection.dart';

/// 20241019

int networkPropagationTime(int N, List<List<int>> edges) {
  // ===================================================
  // step 1:  Perform Dijkstra to exhaustively update
  //          the propagation time to all destinations

  // initialization
  final Map<int, int> nodeLatencies = {};
  nodeLatencies[0] = 0;
  for (var i = 1; i <= N; i++) {
    nodeLatencies[i] = 1e9.toInt();
  }

  final minHeap = PriorityQueue<MapEntry<int, int>>((a, b) {
    return a.value.compareTo(b.value);
  });
  minHeap.add(MapEntry(0, 0));

  // begin relaxation process
  // - access list of neighbor nodes:latencies
  // - iterate through, compare each latency to current's latency + edge weight from current to node
  //      + latency = latencies[neighbor's integer value]
  //      + new latency = current.value + edge.where(0 = curent.key && 1 == neighbor integer value)[2]
  // - if can relax -> update latencies[neighbor], add neighbor-latency tuple to minHeap

  while (minHeap.isNotEmpty) {
    // processing current node
    final current = minHeap.removeFirst();
    final sourceNode = current.key;
    final sourceLatency = current.value;
    final outgoingEdges = edges.where((edge) => edge[0] == sourceNode).toList();

    // processing outgoing edges
    for (var edge in outgoingEdges) {
      final int neighborNode = edge[1];
      final propagationLatency = edge[2];
      final cumulativeLatency = sourceLatency + propagationLatency;

      if (nodeLatencies[neighborNode] == null)
        throw Exception("Node value out of range: 0~$N");
      if (cumulativeLatency < nodeLatencies[neighborNode]!) {
        // update latency records
        nodeLatencies[neighborNode] = cumulativeLatency;
        minHeap.add(MapEntry(neighborNode, cumulativeLatency));
      }
    }
  }

  // ====================================================
  // step 2:  check all nodes for longest propagation time
  return nodeLatencies.values.reduce(max);
}
