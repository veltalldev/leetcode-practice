/// 20241021
int minRemovalsToMatchParentheses(String s) {
  if (s == "") return 0;
  final charList = s.split('');
  final stack = Stack<String>();
  var closeCounter = 0;
  for (var char in charList) {
    if (char == "(")
      stack.push("(");
    else if (char == ")") {
      if (stack.isNotEmpty) {
        stack.pop();
      } else {
        closeCounter++;
      }
    }
  }
  return stack.size + closeCounter;
}

class Stack<T> {
  final List<T> stack = <T>[];

  T pop() {
    if (stack.isNotEmpty) {
      return stack.removeLast();
    } else
      throw Exception("Stack is empty");
  }

  void push(T item) {
    stack.add(item);
  }

  bool get isEmpty => stack.isEmpty;
  bool get isNotEmpty => stack.isNotEmpty;
  int get size => stack.length;
}
