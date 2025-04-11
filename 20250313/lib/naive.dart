/// 20250313
///
/// Create a curried function add_subtract that performs additions and subtractions in alternation
///
/// Start at: 9:01pm

void main(List<String> args) {
  assert(add_subtract(5)(3)(2)(7)(4)() == 9);

  assert(add_subtract(0)(10)(5)(3)(2)() == 6);

  // Starting with negative number
  assert(add_subtract(-10)(5)(7)(2)() == -10);

  // Chaining all at once
  assert(add_subtract(1)(2)(3)(4)(5)() == -1);

  // secondary tests
  alternativeMain();

  print("All tests passed.");
}

void test() {}

Function add_subtract(int first) {
  int result = first;
  bool addNext = true;
  dynamic calc([int? next]) {
    if (next == null) {
      return result;
    } else {
      result += addNext ? next : next * (-1);
      addNext = !addNext;
      return calc;
    }
  }

  return calc;
}

/// First working solution: 9:50pm

class Calculation {
  dynamic _result;
  bool _addNext;

  Calculation(this._result) : _addNext = true {
    if (!(_result is num)) throw TypeError();
  }

  // designate the class as callable
  // returns a dynamic because it needs to be both a value and a function
  dynamic call([dynamic next]) {
    if (next == null) {
      return _result;
    }
    if (!(next is num)) throw TypeError();

    // otherwise update states
    _result += _addNext ? next : next * (-1);
    _addNext = !_addNext;
    return this;
  }

  dynamic get value => _result;
}

Calculation add_subtract_alt(dynamic first) {
  return Calculation(first);
}

void alternativeMain() {
  assert(add_subtract_alt(5)(3)(2)(7)(4).value == 9);
  assert(add_subtract_alt(5.0)(3)(2)(7)(4).value == 9);
  assert(add_subtract_alt(5)(3)(2.0)(7)(4).value == 9);

  assert(add_subtract_alt(0)(10)(5)(3)(2).value == 6);

  // Starting with negative number
  assert(add_subtract_alt(-10)(5)(7)(2).value == -10);

  // Chaining all at once
  assert(add_subtract_alt(1)(2)(3)(4)(5).value == -1);
}

// Second implementation / alternative: 9:57pm
// robust enhancements finished at 10:08pm
