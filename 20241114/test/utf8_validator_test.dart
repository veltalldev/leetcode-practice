import 'package:test/test.dart';
import 'package:leetcode20241114/utf8_validator.dart';

void main() {
  group('UTF8Validator', () {
    late UTF8Validator utf8Validator;

    setUp(() {
      utf8Validator = UTF8Validator();
    });

    // UTF8_Validator does not have any data to initialize
    // skipping test

    group('validate', () {
      test('string validation not supported, should return false', () {
        final utf8BitString = '11100010 10000010 10101100';
        final isValid = utf8Validator.validate(utf8BitString);
        expect(isValid, isFalse);
      });

      group('byte sequence validation', () {
        test('valid empty input', () {
          final bytes = <int>[];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isTrue);
        });
        test('valid single byte', () {
          final bytes = [65];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isTrue);
        });
        test('valid multi-byte', () {
          final bytes = [230, 130, 172]; // '€'
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isTrue);
        });

        test('invalid byte sequence: invalid byte value range', () {
          final bytes = [230, 256, 172];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isFalse);
        });

        test('invalid byte sequence: more than 4 bytes', () {
          final bytes = [230, 130, 172, 143, 143];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isFalse);
        });

        test('invalid byte sequence: bad leading byte', () {
          final bytes = [170, 130, 172];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isFalse);
        });

        test('invalid byte sequence: bad continuation byte(s)', () {
          final bytes = [230, 202, 138];
          final isValid = utf8Validator.validate(bytes);
          expect(isValid, isFalse);
        });
      });
    });
  });
}
