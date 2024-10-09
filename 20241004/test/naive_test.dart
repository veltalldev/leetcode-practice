import 'package:test/test.dart';
import 'package:leetcode20241004/naive.dart';

void main() {
  test('Test single-level map', () {
    Map<String, dynamic> input = {"key": 3, "name": "Dart"};

    Map<String, dynamic> expected = {"key": 3, "name": "Dart"};

    expect(flattenDictionary(input), equals(expected));
  });

  test('Test two-level nested map', () {
    Map<String, dynamic> input = {
      "key": 3,
      "foo": {"a": 5, "b": 6}
    };

    Map<String, dynamic> expected = {"key": 3, "foo.a": 5, "foo.b": 6};

    expect(flattenDictionary(input), equals(expected));
  });

  test('Test deeply nested map', () {
    Map<String, dynamic> input = {
      "key": 3,
      "foo": {
        "a": 5,
        "bar": {"baz": 8}
      }
    };

    Map<String, dynamic> expected = {"key": 3, "foo.a": 5, "foo.bar.baz": 8};

    expect(flattenDictionary(input), equals(expected));
  });

  test('Test empty map', () {
    Map<String, dynamic> input = {};

    Map<String, dynamic> expected = {};

    expect(flattenDictionary(input), equals(expected));
  });

  test('Test nested map with empty map inside', () {
    Map<String, dynamic> input = {"key": 3, "foo": {}};

    Map<String, dynamic> expected = {"key": 3};

    expect(flattenDictionary(input), equals(expected));
  });

  test('Test map with mixed value types', () {
    Map<String, dynamic> input = {
      "key": 3,
      "foo": {
        "a": 5,
        "b": true,
        "bar": {"baz": "nested", "qux": 42}
      }
    };

    Map<String, dynamic> expected = {
      "key": 3,
      "foo.a": 5,
      "foo.b": true,
      "foo.bar.baz": "nested",
      "foo.bar.qux": 42
    };

    expect(flattenDictionary(input), equals(expected));
  });
}
