import 'dart:math';
import 'package:test/test.dart';

/// the idea for improvement comes from a particular technique
/// making use of the max heap to keep track of k smallest terms
/// The performance improvement comes from the fact that maintaining
/// a max-heap of size k over the course of n terms only takes klogk
/// runtime instead of the nlogn runtime of a regular sort approach
///
/// I'm also writing a custom class PointDistance to simplify the logistics

// Unit Tests
void main() {
  group('MaxHeap with PointDistance', () {
    test('Insert points and verify max-heap property', () {
      MaxHeap<PointDistance> heap = MaxHeap<PointDistance>();
      Point target = Point(0, 0);

      heap.insert(PointDistance(Point(1, 2), target)); // Distance = sqrt(5)
      heap.insert(PointDistance(Point(3, 4), target)); // Distance = 5
      heap.insert(PointDistance(Point(6, 8), target)); // Distance = 10
      heap.insert(PointDistance(Point(0, 0), target)); // Distance = 0

      expect(heap.extractMax().distance, equals(10));
      expect(heap.extractMax().distance, equals(5));
      expect(heap.extractMax().distance, equals(sqrt(5)));
      expect(heap.extractMax().distance, equals(0));
    });

    test('MaxHeap handles duplicate distances correctly', () {
      MaxHeap<PointDistance> heap = MaxHeap<PointDistance>();
      Point target = Point(0, 0);

      heap.insert(PointDistance(Point(1, 1), target)); // Distance = sqrt(2)
      heap.insert(PointDistance(Point(1, -1), target)); // Distance = sqrt(2)
      heap.insert(PointDistance(Point(-1, 1), target)); // Distance = sqrt(2)
      heap.insert(PointDistance(Point(-1, -1), target)); // Distance = sqrt(2)

      expect(heap.extractMax().distance, equals(sqrt(2)));
      expect(heap.extractMax().distance, equals(sqrt(2)));
      expect(heap.extractMax().distance, equals(sqrt(2)));
      expect(heap.extractMax().distance, equals(sqrt(2)));
    });

    test('Extracting from an empty heap throws an exception', () {
      MaxHeap<PointDistance> heap = MaxHeap<PointDistance>();

      expect(() => heap.extractMax(), throwsException);
    });

    test(
        'Heap property is maintained after multiple insertions and extractions',
        () {
      MaxHeap<PointDistance> heap = MaxHeap<PointDistance>();
      Point target = Point(0, 0);

      heap.insert(PointDistance(Point(1, 1), target)); // Distance = sqrt(2)
      heap.insert(PointDistance(Point(2, 2), target)); // Distance = sqrt(8)
      heap.insert(PointDistance(Point(3, 3), target)); // Distance = sqrt(18)
      heap.insert(PointDistance(Point(0, 0), target)); // Distance = 0

      expect(heap.extractMax().distance, equals(sqrt(18)));
      expect(heap.extractMax().distance, equals(sqrt(8)));
      heap.insert(PointDistance(Point(4, 4), target)); // Distance = sqrt(32)
      expect(heap.extractMax().distance, equals(sqrt(32)));
      expect(heap.extractMax().distance, equals(sqrt(2)));
    });
  });
  group('findNearestKPoints', () {
    test('Find nearest 2 points from [(0, 0), (5, 4), (3, 1)]', () {
      List<Point> points = [
        Point(0, 0),
        Point(5, 4),
        Point(3, 1),
      ];
      Point target = Point(1, 2);
      int k = 2;

      List<Point> result = findNearestKPoints(points, target, k);

      expect(result.length, equals(2));
      expect(result, containsAll([Point(0, 0), Point(3, 1)]));
    });

    test('Find nearest 1 point from [(1, 2), (3, 4), (5, 6)]', () {
      List<Point> points = [
        Point(1, 2),
        Point(3, 4),
        Point(5, 6),
      ];
      Point target = Point(1, 2);
      int k = 1;

      List<Point> result = findNearestKPoints(points, target, k);

      expect(result.length, equals(1));
      expect(result.first, equals(Point(1, 2)));
    });

    test('Find nearest 2 points from [(1, 2), (3, 4), (0, 1)]', () {
      List<Point> points = [
        Point(1, 2),
        Point(3, 4),
        Point(0, 1),
      ];
      Point target = Point(1, 2);
      int k = 2;

      List<Point> result = findNearestKPoints(points, target, k);

      expect(result.length, equals(2));
      expect(result, containsAll([Point(1, 2), Point(0, 1)]));
    });

    test('Find nearest 3 points from [(3, 3), (2, 2), (1, 1)]', () {
      List<Point> points = [
        Point(3, 3),
        Point(2, 2),
        Point(1, 1),
      ];
      Point target = Point(1, 2);
      int k = 3;

      List<Point> result = findNearestKPoints(points, target, k);

      expect(result.length, equals(3));
      expect(result, containsAll([Point(1, 1), Point(2, 2), Point(3, 3)]));
    });

    test('Find nearest 0 points (k=0)', () {
      List<Point> points = [
        Point(1, 2),
        Point(3, 4),
        Point(5, 6),
      ];
      Point target = Point(1, 2);
      int k = 0;

      List<Point> result = findNearestKPoints(points, target, k);

      expect(result.length, equals(0));
    });
  });
}

List<Point> findNearestKPoints(List<Point> points, Point target, int k) {
  if (k < 1) return [];
  final pdlist = points.map((point) => PointDistance(point, target)).toList();

  // create the heap
  final pdheap = MaxHeap<PointDistance>();
  pdlist.take(k).forEach((pd) {
    pdheap.insert(pd);
  });

  // check the remaining points, if smaller than max, include into k points
  pdlist.skip(k).toList().forEach((pd) {
    if (pd.compareTo(pdheap.heap[0]) < 0) {
      pdheap.heap[0] = pd;
      pdheap._heapifyDown(0);
    }
  });

  return pdheap.heap.map((entry) => entry.p).toList();
}

// ===============================================================

class Point {
  final double x;
  final double y;
  const Point(this.x, this.y);
  @override
  String toString() {
    return "($x, $y)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode & y.hashCode;
}

// keeps track of a 2D point and its distance from the target
class PointDistance implements Comparable<PointDistance> {
  final Point p;
  final Point target;
  final double distance;
  const PointDistance._internal(this.p, this.target, this.distance);

  factory PointDistance(Point p, Point target) {
    double distance = sqrt(pow(target.x - p.x, 2) + pow(target.y - p.y, 2));
    return PointDistance._internal(p, target, distance);
  }

  @override
  int compareTo(PointDistance other) {
    return distance.compareTo(other.distance);
  }

  @override
  String toString() => "($p: ${distance.toStringAsFixed(2)})";
}

class MaxHeap<T extends Comparable<T>> {
  List<T> heap = [];

  void insert(T value) {
    // insert to the end
    heap.add(value);
    // heapify the last index, aka index of the newest item, to the front
    _heapifyUp(heap.length - 1);
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    int parentIndex = (index - 1) ~/ 2;

    // swapping with parent as needed and continue recursively
    if (heap[index].compareTo(heap[parentIndex]) > 0) {
      _swap(index, parentIndex);
      _heapifyUp(parentIndex);
    }
  }

  void _swap(int index1, int index2) {
    T temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  T extractMax() {
    if (heap.isEmpty) throw Exception("Heap is empty");

    T max = heap.first;
    T last = heap.removeLast(); // chop off the end and wedge it in the front
    if (heap.length > 0) {
      heap[0] = last;
      _heapifyDown(0); // maintain heap property by heapifying the front down
    }

    return max;
  }

  void _heapifyDown(int index) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int largest = index;

    // after both comparisons, the largest either
    // 1. remains as the parent
    // 2. becomes the left child
    // 3. gets overwritten by the right child

    if (leftChild < heap.length &&
        heap[largest].compareTo(heap[leftChild]) < 0) {
      largest = leftChild;
    }

    if (rightChild < heap.length &&
        heap[largest].compareTo(heap[rightChild]) < 0) {
      largest = rightChild;
    }

    // swap with larger child as needed, then continue recursively with that child
    if (largest != index) {
      _swap(index, largest);
      _heapifyDown(largest);
    }
  }

  @override
  String toString() => heap.toString();
}
