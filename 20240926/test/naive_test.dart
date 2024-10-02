import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('BloomFilterSet Tests', () {
    test('Add and check single element', () {
      // Arrange
      final bloomFilter = BloomFilterSet<String>();

      // Act
      bloomFilter.add("hello");

      // Assert
      expect(bloomFilter.check("hello"), isTrue);
      expect(bloomFilter.check("world"), isFalse); // False positive unlikely
    });

    test('Add multiple elements and check their presence', () {
      // Arrange
      final bloomFilter = BloomFilterSet<String>();

      // Act
      bloomFilter.add("apple");
      bloomFilter.add("banana");
      bloomFilter.add("cherry");

      // Assert
      expect(bloomFilter.check("apple"), isTrue);
      expect(bloomFilter.check("banana"), isTrue);
      expect(bloomFilter.check("cherry"), isTrue);

      // Unadded element
      expect(bloomFilter.check("grape"), isFalse);
    });

    test('Check false positive for element not added', () {
      // Arrange
      final bloomFilter = BloomFilterSet<String>();

      // Act
      bloomFilter.add("car");
      bloomFilter.add("bike");
      bloomFilter.add("train");

      // Assert (False positives can occur but should be rare)
      expect(bloomFilter.check("car"), isTrue);
      expect(bloomFilter.check("bike"), isTrue);
      expect(bloomFilter.check("train"), isTrue);

      // Random words that weren't added
      expect(bloomFilter.check("airplane"), isFalse);
      expect(bloomFilter.check("bus"), isFalse);
    });

    test('Check for empty filter (nothing added)', () {
      // Arrange
      final bloomFilter = BloomFilterSet<String>();

      // Assert
      expect(bloomFilter.check("hello"), isFalse);
      expect(bloomFilter.check("world"), isFalse);
    });
  });
}
