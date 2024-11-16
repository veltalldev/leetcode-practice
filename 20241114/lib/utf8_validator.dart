/// A validator for UTF-8 encoded character sequences.
///
/// Validates whether a given encoded sequence follows UTF-8 encoding rules:
/// - Single byte: 0xxxxxxx
/// - Two bytes: 110xxxxx 10xxxxxx
/// - Three bytes: 1110xxxx 10xxxxxx 10xxxxxx
/// - Four bytes: 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
class UTF8Validator {
  // Byte pattern masks and values as static constants
  static const _SINGLE_BYTE_MASK = 0x80; // 10000000
  static const _TWO_BYTES_MASK = 0xE0; // 11100000
  static const _THREE_BYTES_MASK = 0xF0; // 11110000
  static const _FOUR_BYTES_MASK = 0xF8; // 11111000
  static const _CONT_BYTE_MASK = 0xC0; // 11000000

  static const _TWO_BYTES_PATTERN = 0xC0; // 11000000
  static const _THREE_BYTES_PATTERN = 0xE0; // 111static const
  static const _FOUR_BYTES_PATTERN = 0xF0; // 111static const
  static const _CONT_BYTE_PATTERN = 0x80; // 10000000

  static const _MAX_BYTES = 5;
  static const _MIN_BYTE_VALUE = 0;
  static const _MAX_BYTE_VALUE = 255;

  /// Validates a UTF-8 encoded character sequence.
  ///
  /// Currently supports:
  /// - List<int> representing byte values
  ///
  /// Throws:
  /// - [ArgumentError] if the input format is not supported
  /// - [RangeError] if any byte value is outside valid range [0-255]
  ///
  /// Returns true if the sequence is a valid UTF-8 encoding, false otherwise
  bool validate(Object encoding) {
    return switch (encoding) {
      List<int> list => _validateByteSequence(list),
      String => throw ArgumentError("String validation not yet supported"),
      _ => throw ArgumentError(
          "Unsupported encoding format: ${encoding.runtimeType}",
        )
    };
  }

  // bool _validateStringInput(String rawInput) {
  // TODO: Implement string validation logic
  // }

  /// Validates a sequence of bytes against UTF-8 encoding rules.
  ///
  /// Throws [RangeError] for any invalid byte value
  bool _validateByteSequence(List<int> bytes) {
    // Empty sequence is valid per UTF-8 specs
    if (bytes.isEmpty) return true;

    // Validates sequence length
    if (bytes.length > _MAX_BYTES) return false;

    // throws [RangeError] if any value is not in valid range
    _validateByteRange(bytes);

    return _validateUTF8Patterns(bytes);
  }

  /// Validates that all byte values are within valid range [0-255].
  ///
  /// Throws [RangeError] for any invalid value.
  void _validateByteRange(List<int> bytes) {
    for (var i = 0; i < bytes.length; i++) {
      if (bytes[i] < _MIN_BYTE_VALUE || bytes[i] > _MAX_BYTE_VALUE) {
        throw RangeError.range(
          bytes[i],
          _MIN_BYTE_VALUE,
          _MAX_BYTE_VALUE,
          'byte value at index $i',
        );
      }
    }
  }

  /// Validates UTF-8 bit patterns for the byte sequence.
  bool _validateUTF8Patterns(List<int> bytes) {
    // helper functions to check byte pattern
    bool hasValidPrefix(int byte, int mask, int pattern) =>
        (byte & mask) == pattern;

    // Specifically check pattern for continuation bytes
    bool _validateContinuationBytes(List<int> contBytes) {
      return contBytes
          .every((byte) => (byte & _CONT_BYTE_MASK) == _CONT_BYTE_PATTERN);
    }

    return switch (bytes.length) {
      1 => (bytes[0] & _SINGLE_BYTE_MASK) == 0,
      2 => hasValidPrefix(bytes[0], _TWO_BYTES_MASK, _TWO_BYTES_PATTERN) &&
          _validateContinuationBytes(bytes.sublist(1)),
      3 => hasValidPrefix(bytes[0], _THREE_BYTES_MASK, _THREE_BYTES_PATTERN) &&
          _validateContinuationBytes(bytes.sublist(1)),
      4 => hasValidPrefix(bytes[0], _FOUR_BYTES_MASK, _FOUR_BYTES_PATTERN) &&
          _validateContinuationBytes(bytes.sublist(1)),
      _ => false
    };
  }
}
