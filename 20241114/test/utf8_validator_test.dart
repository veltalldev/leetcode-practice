import 'package:test/test.dart';
import 'package:leetcode20241114/utf8_validator.dart';

void main() {
  group('UTF8Validator', () {
    late UTF8Validator validator;

    setUp(() {
      validator = UTF8Validator();
    });

    group('Input validation', () {
      test('throws ArgumentError for unsupported types', () {
        expect(() => validator.validate(42), throwsArgumentError);
      });

      test('throws ArgumentError for string input', () {
        expect(() => validator.validate("t"), throwsArgumentError);
      });

      test('throws RangeError for byte values out of valid range', () {
        expect(() => validator.validate([-1]), throwsRangeError);
        expect(() => validator.validate([256]), throwsRangeError);
      });
    });

    group('Empty Sequence validation', () {
      test('validates empty byte sequence as true', () {
        expect(validator.validate(<int>[]), isTrue);
      });
    });

    group('single byte validation', () {
      test('validates ASCII characters (0-127)', () {
        expect(validator.validate([64]), isTrue);
        expect(validator.validate([127]), isTrue);
      });

      test('invalidates bytes with MSB set', () {
        expect(validator.validate([128]), isFalse);
        expect(validator.validate([255]), isFalse);
      });
    });

    group('two byte sequence validation', () {
      test('validates valid two byte sequences', () {
        // Example: Latin small letter a with acute
        expect(validator.validate([0xC3, 0xA1]), isTrue);
      });
      test('invalidates sequences with wrong continuation byte', () {
        expect(validator.validate([0xC3, 0xC1]), isFalse);
      });
    });

    group('three byte sequence validation', () {
      test('validates valid three byte sequences', () {
        // Example: Euro sign
        expect(validator.validate([0xE2, 0x82, 0xAC]), isTrue);
      });
      test('invalidates sequences with wrong continuation bytes', () {
        expect(validator.validate([0xE2, 0xC2, 0xAC]), isFalse);
        expect(validator.validate([0xE2, 0x82, 0xC0]), isFalse);
      });
    });

    group('four byte sequence validation', () {
      test('validates valid four byte sequences', () {
        // Example: Emoji person bowing deeply
        expect(validator.validate([0xF0, 0x9F, 0x99, 0x87]), isTrue);
      });

      test('invalidates sequences with wrong continuation bytes', () {
        expect(validator.validate([0xF0, 0xC0, 0x99, 0x87]), isFalse);
        expect(validator.validate([0xF0, 0x9F, 0xC0, 0x87]), isFalse);
        expect(validator.validate([0xF0, 0x9F, 0x99, 0xC0]), isFalse);
      });
    });

    group('sequence length validation', () {
      test('invalidates sequences longer than 4 bytes', () {
        expect(validator.validate([1, 1, 1, 1, 1]), isFalse);
      });
    });
  });
}
