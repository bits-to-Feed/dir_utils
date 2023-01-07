Makes directory traversal easier. No need to worry about path concatenation and stuff.

## Getting started

Add dir_utils as a dependency in the pubspec.yaml file. Or run `dart pub add dir_utils`/`flutter pub add dir_utils`

## Usage

import the package 
```dart
import 'package:dir_utils/dir_utils.dart';
```

Go deep in dirs
```dart
final Directory myDir = Directory.current
      .dir('very')
      .dir('deep')
      .dir('nested')
      .dir('dir');
```

Get file of a Directory
```dart
final File myFile = Directory.current.file('myFile.json');
```

Get the files of a Directory
```dart
final List<File> myFiles = Directory.current.getFiles().toList();
```

Get the name of a FileSystemEntity
```dart
final String currentDirName = Directory.current.name;
```