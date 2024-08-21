import 'dart:collection';
import 'package:test/test.dart';

/// This brute force method applies the process to the initial number and ALL of its
/// descendants via the processing of a FIFO queue until the value 1 is reached
/// Let's dub this procedure the "Collatz at home" conjecture

void main() {
  // testFactorize();
  int N = 100;
  int iter = runCollatzAtHomeLoop(N);
  print("N = $N, takes $iter steps");
  // print(factorize(2));
}

class Tuple<A, B> {
  final A value;
  final B iterations;

  const Tuple(this.value, this.iterations);
  @override
  // String toString() => "(value: $value, iteration: $iterations)";
  String toString() => "($value, $iterations)";
}

int runCollatzAtHomeLoop(int N) {
  Queue<Tuple<int, int>> queue = Queue()..add(Tuple(100, 0));
  while (queue.isNotEmpty) {
    // dequeue
    Tuple T = queue.removeFirst();
    print("Processing $T");
    if (T.value == 1) {
      return T.iterations;
    }
    // queue T - 1
    queue.add(Tuple(T.value - 1, T.iterations + 1));
    // queue all factors of T
    print("Iteration ${T.iterations}: Factors of ${T.value}");
    queue.addAll(factorize(T.value).where((int k) => k != 1 && k != T.value).map((int k) => Tuple(k, T.iterations + 1)));

    print("ENDING loop, queue = $queue");
  }
  return -1; // theoretically we should never exit the loop because value 1 eventually has to be found
}

// return a set of ALL integer factors of N
Set<int> factorize(int N) {
  if (N <= 0) {
    return Set<int>();
  }
  Set<int> factors = {1, N};
  for (var i = 2; i < N; i++) {
    if (N % i == 0) {
      factors.add(i);
    }
  }
  return factors;
}

void testFactorize() {
  group('factorize', () {
    test('Factors of 1 should return {1}', () {
      expect(factorize(1), equals({1}));
    });

    test('Factors of 2 should return {1, 2}', () {
      expect(factorize(2), equals({1, 2}));
    });

    test('Factors of 12 should return {1, 2, 3, 4, 6, 12}', () {
      expect(factorize(12), equals({1, 2, 3, 4, 6, 12}));
    });

    test('Factors of 16 should return {1, 2, 4, 8, 16}', () {
      expect(factorize(16), equals({1, 2, 4, 8, 16}));
    });

    test('Factors of the prime number 17 should return {1, 17}', () {
      expect(factorize(17), equals({1, 17}));
    });

    test('Factors of 100 should return {1, 2, 4, 5, 10, 20, 25, 50, 100}', () {
      expect(factorize(100), equals({1, 2, 4, 5, 10, 20, 25, 50, 100}));
    });

    test('Factors of 0 should return an empty set', () {
      expect(factorize(0), equals(Set<int>()));
    });

    test('Factors of a negative number -12 should return an empty set', () {
      expect(factorize(-12), equals(Set<int>()));
    });

    test(
        'Factors of a large number 1000000 should include {1, 2, 4, 5, 10, 100, 1000, 1000000}',
        () {
      expect(factorize(1000000),
          containsAll({1, 2, 4, 5, 10, 100, 1000, 1000000}));
    });
  });
}
