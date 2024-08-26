import 'dart:math';
import 'package:test/test.dart';

/// this is a simple looking problem where we just calculate the cartesian distances then sort them

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  double distannceFrom(Point p) {
    return sqrt(pow(x - p.x, 2) + pow(y - p.y, 2));
  }

  @override
  String toString() {
    return "($x, $y)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Point) return false;
    return x == other.x && y == other.y;
  }
}

List<Point> nearestKPoints(List<Point> points, Point center, int k) {
  if (k > points.length) {
    return [];
  }
  var sortedList = points.map((Point p) {
    double distance = p.distannceFrom(center);
    return MapEntry(p, distance);
  }).toList()
    ..sort((a, b) {
      // Sort in ascending order
      return a.value.compareTo(b.value);
    });

  return sortedList
      .map((mapEntry) {
        return mapEntry.key;
      })
      .toList()
      .sublist(0, k);
}

void main(List<String> args) {
  group('nearestKPoints', () {
    test('Test Case 1: General case', () {
      final points = [Point(0, 0), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(0, 0), Point(3, 1)]));
    });
    test('Test Case 2: k = list.length', () {
      final points = [Point(0, 0), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 3;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(0, 0), Point(3, 1), Point(5, 4)]));
    });
    test('Test Case 3: list length 1', () {
      final points = [Point(3, 3)];
      final center = Point(1, 2);
      final k = 1;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(3, 3)]));
    });
    test('Test Case 4: Negative coordinates', () {
      final points = [Point(-1, -2), Point(-3, -4), Point(1, 2)];
      final center = Point(0, 0);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(-1, -2), Point(1, 2)]));
    });
    test('Test Case 5: General case', () {
      final points = [Point(0, 0), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(0, 0), Point(3, 1)]));
    });
    test('Test Case 6: k > list.length', () {
      final points = [Point(0, 0), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(0, 0), Point(3, 1)]));
    });
    test('Test Case 7: Empty list', () {
      final points = <Point>[];
      final center = Point(1, 2);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([]));
    });
    test('Test Case 8: k = 0', () {
      final points = [Point(0, 0), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 0;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([]));
    });
    test('Test Case 9: Central Point is in the list', () {
      final points = [Point(1, 2), Point(5, 4), Point(3, 1)];
      final center = Point(1, 2);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(1, 2), Point(3, 1)]));
    });
    test('Test Case 10: Equidistant points', () {
      final points = [Point(1, 1), Point(-1, 1), Point(1, -1), Point(-1, -1)];
      final center = Point(0, 0);
      final k = 2;
      final result = nearestKPoints(points, center, k);
      expect(result, equals([Point(1, 1), Point(-1, 1)]));
    });
  });
}
