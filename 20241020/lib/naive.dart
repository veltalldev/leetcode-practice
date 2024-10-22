import 'dart:math';

/// 20241020

bool hasArbitrage(List<List<double>> exchangeRates) {
  // Step 1:  Transform data to -log(n)
  final List<List<double>> logRates = [];
  for (var row in exchangeRates) {
    logRates.add(List.generate(row.length, (i) => -log(row[i])));
  }
  print("finished transofrmation, logRates = ");
  for (var row in logRates) {
    print(row.map((e) => e.toStringAsFixed(2)).toList());
    print(''); // Newline after each row
  }

  final n = logRates.length;
  final epsilon = 0.01; // Small tolerance for floating-point precision

  // Bellman-Ford runs from each node as a starting point
  final distances = List.filled(n, 1e9);
  distances[0] = 0;

  // Step 2: Perform Bellman-Ford algorithm
  for (var iteration = 1; iteration <= n - 1; iteration++) {
    for (var u = 0; u < n; u++) {
      for (var v = 0; v < n; v++) {
        final edgeWeight = logRates[u][v];
        final newTotalWeight = distances[u] + edgeWeight;
        // Relax the edge
        if (newTotalWeight < distances[v] - epsilon) {
          distances[v] = newTotalWeight;
        }
      }
    }
  }
  // Step 3: Check for negative cycle (one more relaxation round)
  for (var u = 0; u < n; u++) {
    for (var v = 0; v < n; v++) {
      final edgeWeight = logRates[u][v];
      final newTotalWeight = distances[u] + edgeWeight;
      // If we can relax further, there's a negative cycl:weightse
      if (newTotalWeight < distances[v] - epsilon) {
        return true; // Arbitrage opportunity exists
      }
    }
  }

  return false; // No arbitrage opportunity found
}

