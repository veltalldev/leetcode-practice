/// this version of the solution makes use of Regex to simplify the
/// extraction of information from the encoded string

import 'dart:core';
import 'package:test/test.dart';

String runLengthDecode(String encodedString) {
  // match the pattern of number followed by one letter
  final regex = RegExp(r'(\d+)([a-zA-Z])');
  final matches = regex.allMatches(encodedString);

  final decodedString = StringBuffer();

  for (var match in matches) {
    int freq = int.parse(match.group(1)!);
    String letter = match.group(2)!;

    decodedString.write(letter * freq);
  }

  return decodedString.toString();
}

void main() {
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
