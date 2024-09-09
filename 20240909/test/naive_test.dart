import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('hasTripletWithSum', () {
    test('should return true for a valid triplet sum', () {
      var numbers = [20, 303, 3, 4, 25];
      var k = 49;
      expect(hasTripletWithSum(numbers, k), isTrue);
    });

    test('should return false when no valid triplet exists', () {
      var numbers = [10, 20, 30, 40];
      var k = 100;
      expect(hasTripletWithSum(numbers, k), isFalse);
    });

    test('should return false for a list with fewer than 3 elements', () {
      var numbers = [1, 2];
      var k = 3;
      expect(hasTripletWithSum(numbers, k), isFalse);
    });

    test('should return true when triplet sum includes negative numbers', () {
      var numbers = [-10, 20, 30, -5];
      var k = 15;
      expect(hasTripletWithSum(numbers, k), isTrue);
    });

    test('should return true when the sum involves zero as part of the triplet',
        () {
      var numbers = [0, 10, 20, 30];
      var k = 30;
      expect(hasTripletWithSum(numbers, k), isTrue);
    });
  });
}
