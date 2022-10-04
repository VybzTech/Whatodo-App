// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:whatodo/Components/Todo.dart';

class Boxes {
  static Box<Todo> getTodos() => Hive.box<Todo>('WhaTodo');
  static Box<String> getFolders() => Hive.box<String>('Folders');
}
