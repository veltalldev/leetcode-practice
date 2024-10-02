import 'dart:typed_data';

/// 20240926
/// ### Problem: Implement a Special Data Structure // Bloom Filter
///
/// So I didn't know anything about this data structure and had to
/// accidentally come across it in my research. I will implement this
/// for practice nevertheless.

class BloomFilterSet<T> {
  final databits = Uint8List(1 << 24);
  final n = 1 << 24;

  List<int Function(T)> hashFunctions = [
    (x) => (x.hashCode.abs() * 17) % (1 << 24),
    (x) => (x.toString().hashCode.abs() * 31) % (1 << 24),
    (x) => (x.runtimeType.hashCode.abs() * 5) % (1 << 24),
  ];

  void add(T value) {
    final bitPositions = hashFunctions.map((hashFunction) {
      return hashFunction(value);
    }).toList();

    bitPositions.forEach((pos) {
      final index = pos ~/ 8; // access the byte that contains this bit
      final bitmask = 1 << (pos % 8); // mask the bit that needs to change
      databits[index] |= bitmask; // apply mask to flip the bit
    });
  }

  bool check(T value) {
    final bitPositions = hashFunctions.map((hashFunction) {
      return hashFunction(value);
    }).toList();

    return bitPositions.every((pos) {
      final index = pos ~/ 8;
      final bitmask = 1 << (pos % 8);
      return databits[index] & bitmask != 0;
    });
  }
}
