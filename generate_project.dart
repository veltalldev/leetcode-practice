import 'dart:io';

void main(List<String> arguments) async {
  // Check if the user provided a project name
  if (arguments.isEmpty) {
    print('Error: Please provide a project name as an argument.');
    exit(1);
  }

  // Get the project name from the arguments
  var projectName = arguments[0];

  // Directories
  var directories = [
    '$projectName/lib',
    '$projectName/test',
  ];

  // Files
  var files = {
    '$projectName/lib/naive.dart': '/// $projectName', // Sample Dart file
    '$projectName/test/naive_test.dart': '''
import 'package:test/test.dart';
import ''../lib/naive.dart'';

void main() {
  test('sample test', () {
    expect(true, isTrue);
  });
}
''',
    '$projectName/pubspec.yaml': '''
name: leetcode$projectName
description: 
version: 1.0.0
environment:
  sdk: '>=2.17.0 <3.0.0'
dependencies:
  collection: ^1.16.0
dev_dependencies:
  test: ^1.25.8
''',
    '$projectName/README.md': '',
  };

  // Create directories
  for (var dir in directories) {
    await Directory(dir).create(recursive: true);
    print('Created directory: $dir');
  }

  // Create files
  files.forEach((path, content) async {
    var file = File(path);
    await file.writeAsString(content);
    print('Created file: $path');
  });

  print('Project structure for "$projectName" generated successfully!');
}
