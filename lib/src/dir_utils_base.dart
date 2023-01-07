import 'dart:io';

final String _ps = Platform.pathSeparator;

extension DirUtils on Directory {
  /// Returns a child [Directory] with the provided name.
  ///
  /// If `name` is empty, returns the current [Directory].
  ///
  /// If `createIfDoesNotExist` is true, the child directory will be created if
  /// it does not exist. This uses [createSync], which is a potentially blocking IO operation.
  ///
  /// if `createRecursively` is true while `createIfDoesNotExist` is true, the
  /// child directory and it's ancestors will be created recursively
  Directory dir(
    String name, {
    final bool createIfDoesNotExist = false,
    final bool createRecursively = false,
  }) {
    if (name.isEmpty) {
      return this;
    }

    final Directory newDir = Directory(path + _ps + name);

    if (createIfDoesNotExist) {
      newDir.createSync(recursive: createRecursively);
    }

    return newDir;
  }

  /// Returns the [File] with the provided `name` which is the child of this [Directory]
  File file(String name) => File(path + _ps + name);

  /// Returns the child directories of this [Directory.path].
  ///
  /// If `recursive` is true, it will recurse through child directories and
  /// return their directories as well.
  Iterable<Directory> getDirs({final bool recusrive = false}) =>
      listSync().whereType<Directory>();

  /// Returns the files in this [Directory.path]
  ///
  /// If `recursive` is true, it will recurse through child directories and
  /// return their [File]s as well.
  Iterable<File> getFiles({final bool recusive = false}) =>
      listSync().whereType<File>();

  /// Returns the child [Link]s of this [Directory.path]
  ///
  /// If `recursive` is true, it will recurse through child directories and
  /// return their [Link]s as well.
  Iterable<Link> getLinks({final bool recusive = false}) =>
      listSync().whereType<Link>();
}

extension DirUtilsEntity on FileSystemEntity {
  /// The name of this [FileSystemEntity]
  String get name => path.substring(path.lastIndexOf(_ps) + 1);
}
