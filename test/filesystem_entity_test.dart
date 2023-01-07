import 'dart:io';

import 'package:dir_utils/dir_utils.dart';
import 'package:test/test.dart';

void main() {
  group('FileSystemEntity extensions:', () {
    final String ps = Platform.pathSeparator;
    test(
      'Entity name is returned accurately',
      () {
        const String name = 'name';
        final File file = File(name);

        expect(file.name, name);

        final File file2 = File('dir$ps$name');

        expect(file2.name, name);
      },
    );
  });
}
