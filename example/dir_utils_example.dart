import 'dart:io';

import 'package:dir_utils/dir_utils.dart';

void main() {
  // Traverse through directories
  final File file = Directory.current
      .dir('very')
      .dir('deep')
      .dir('nested')
      .dir('dir')
      .dir('and')
      .file('file');

  // Get the files in the current directory
  final List<File> files = Directory.current.getFiles().toList();

  // Create the file and ancestor directories if they don't exist
  file.createSync(recursive: true);

  // Name of the current directory
  file.writeAsStringSync('Files in ${Directory.current.name}');

  // Write the name of the files in the current directory
  file.writeAsStringSync(
    files.map((e) => e.name).toList().join('\n'),
    mode: FileMode.append,
  );
}
