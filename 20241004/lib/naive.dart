/// 20241004
/// Assumptions:
///   - The dictionary keys are of type String
/// Solution:
/// We leverage recursion to flatten the value of Map type into
/// a Map type (but with no nesting inside) so we can just `.addAll()` the
/// entire map and return
/// The namespace is propagated by appending the key to the back of
/// the namespace:
///   - if progpagating deeper, append key and dot at the end
///   - otherwise just append key then access

Map<String, dynamic> flattenDictionary(Map<String, dynamic> dictionary,
    [String namespace = '']) {
  final flattenedDict = <String, dynamic>{};

  dictionary.forEach((key, value) {
    final newName = namespace + key + '.';
    if (value is Map) {
      flattenedDict.addAll(
        flattenDictionary(
          Map<String, dynamic>.from(value),
          newName,
        ),
      );
    } else {
      flattenedDict[namespace + key] = value;
    }
  });
  return flattenedDict;
}

void main(List<String> args) {
  Map<String, dynamic> dict = {
    "key": 3,
    "foo": {
      "a": 5,
      "bar": {"baz": 8}
    }
  };

  print(flattenDictionary(dict));
}
