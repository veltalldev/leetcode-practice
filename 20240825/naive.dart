/// 1. Scan the input string for repeated successive character segments
/// 2. Store such segments in a list
/// 3. convert list of segment strings into list of "run-length" tokens
/// 4. convert back into list of "run-length" strings then join()

import 'dart:core';

import 'package:test/test.dart';

/// split the input string into list of substrings, each a sequencce of
/// consecutively repeated leters
List<String> extractRunLengthPartitions(String rawInput) {
  List<String> partitions = [];
  // edge case
  if (rawInput.length < 1) return partitions;

  // compare letter
  String currentPartition = rawInput[0];

  // loop through input string
  for (var i = 1; i < rawInput.length; i++) {
    // found a continuation
    if (rawInput[i] == currentPartition[0]) {
      currentPartition += rawInput[i];
    } else {
      // found the end of current partition
      partitions.add(currentPartition);
      currentPartition = rawInput[i]; // track the new partition
    }
  }

  // add the last partition manually
  partitions.add(currentPartition);

  return partitions;
}

// given an encoded string, decode it into groups of repeated letters
List<String> reconstructRunLengthPartitions(String encodedString) {
  final partitions = <(String, int)>[];

  // chop off the processed part of the input after processing is done
  while (encodedString.length > 0) {
    final (letter, index) = findFirstLetter(encodedString);
    if (index != -1) {
      int freq = int.parse(encodedString.substring(0, index));
      partitions.add((letter, freq));
      encodedString = encodedString.substring(index + 1);
    }
  }
  return partitions
      .map((record) => List.filled(record.$2, record.$1).join(''))
      .toList();
}

(String, int) findFirstLetter(String encodedString) {
  final index = encodedString.split('').indexWhere((char) {
    return RegExp(r'^[a-zA-Z]$').hasMatch(char);
  });
  if (index != -1) {
    final letter = encodedString[index];
    return (letter, index);
  } else {
    return ("", -1);
  }
}

class RunLengthToken {
  final String token;
  final int count;

  const RunLengthToken(this.token, this.count);

  // input string is assumed to be a non-empty string of repeated characters
  RunLengthToken.fromString(String input)
      : token = input.length > 0 ? input[0] : "",
        count = input.length {
    if (input.length == 0) {
      throw RangeError('Empty String encountered');
    }
  }

  String getEncodedString() {
    if (count == 0) return "";
    return "${count}${token}";
  }
}

String runLengthEncode(String input) {
  // partition input strings into segments of repeated letters
  final List<String> partitions = extractRunLengthPartitions(input);

  // encode the strings and join them into the encoded output
  return partitions.map((runString) {
    final rlt = RunLengthToken.fromString(runString);
    return rlt.getEncodedString();
  }).join();
}

String runLengthDecode(String encodedString) {
  // using the encoded data to reconstruct a list of segments, each
  // a sequence of consecutively repeated letters
  final partitions = reconstructRunLengthPartitions(encodedString);
  return partitions.join('');
}

void main() {
  testRunLengthToken();
  testRunLengthEncode();
  testRunLengthDecode();
}

void testRunLengthDecode() {
  group('runLengthDecode', () {
    test('Decodes a string with simple repeated characters', () {
      expect(runLengthDecode('10A2B'), equals('AAAAAAAAAABB'));
      expect(runLengthDecode('3B3A'), equals('BBBAAA'));
      expect(runLengthDecode('2A2B2C'), equals('AABBCC'));
    });

    test('Decodes a string with single characters', () {
      expect(runLengthDecode('1A1B1C'), equals('ABC'));
      expect(runLengthDecode('1A'), equals('A'));
    });

    test('Decodes an empty string to an empty string', () {
      expect(runLengthDecode(''), equals(''));
    });

    test('Decodes a string with mixed character lengths', () {
      expect(runLengthDecode('1A10B2C'), equals('ABBBBBBBBBBCC'));
      expect(runLengthDecode('2Z1Y3X'), equals('ZZYXXX'));
    });

    test('Decodes a string with case-sensitive characters', () {
      expect(runLengthDecode('2a2A'), equals('aaAA'));
      expect(runLengthDecode('3B1b'), equals('BBBb'));
    });
  });
}

void testRunLengthEncode() {
  group('runLengthEncode', () {
    test('Encodes a string with repeated characters', () {
      expect(runLengthEncode('AAAAAAAAAABB'), equals('10A2B'));
      expect(runLengthEncode('BBBAAA'), equals('3B3A'));
      expect(runLengthEncode('AABBCC'), equals('2A2B2C'));
    });

    test('Handles single character strings correctly', () {
      expect(runLengthEncode('A'), equals('1A'));
      expect(runLengthEncode('B'), equals('1B'));
    });

    test('Returns empty string for empty input', () {
      expect(runLengthEncode(''), equals(''));
    });

    test('Handles strings with no repeated characters correctly', () {
      expect(runLengthEncode('ABC'), equals('1A1B1C'));
    });

    test('Handles strings with different case letters correctly', () {
      expect(runLengthEncode('AaAaAa'), equals('1A1a1A1a1A1a'));
      expect(runLengthEncode('aAaAaA'), equals('1a1A1a1A1a1A'));
    });
  });
}

void testRunLengthToken() {
  group('RunLengthToken', () {
    test('Constructor initializes with correct values', () {
      const token = RunLengthToken('a', 3);
      expect(token.token, equals('a'));
      expect(token.count, equals(3));
    });

    test('fromString constructor creates correct RunLengthToken', () {
      var token = RunLengthToken.fromString('aaa');
      expect(token.token, equals('a'));
      expect(token.count, equals(3));

      token = RunLengthToken.fromString('bb');
      expect(token.token, equals('b'));
      expect(token.count, equals(2));
    });

    test('getEncodedString returns correct encoded string', () {
      const token = RunLengthToken('a', 3);
      expect(token.getEncodedString(), equals('3a'));

      const token2 = RunLengthToken('b', 5);
      expect(token2.getEncodedString(), equals('5b'));
    });

    test('fromString handles single character string correctly', () {
      var token = RunLengthToken.fromString('x');
      expect(token.token, equals('x'));
      expect(token.count, equals(1));
      expect(token.getEncodedString(), equals('1x'));
    });

    test('fromString throws error on empty string', () {
      expect(() => RunLengthToken.fromString(''), throwsRangeError);
    });
  });
}
