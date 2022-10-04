// ignore_for_file: file_names
import 'dart:math';
import 'package:hive/hive.dart';
part 'Todo.g.dart';
// class Task {
//   @HiveField(0)
//   String task;
//   // Just an example for next attribute
//   // @HiveField(1)
//   // bool checked;
//   Task({this.task});
// }

@HiveType(typeId: 0)
// class Todo {
class Todo extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime createdTime;
  @HiveField(2)
  String taskName;
  @HiveField(3)
  String folder;
  @HiveField(4)
  String priority;
  @HiveField(5)
  String dueDate;
  @HiveField(6)
  String notes;
  @HiveField(7)
  String recurring;
  @HiveField(8)
  List<String> subtasks;
  @HiveField(9)
  List<int> dep;
  @HiveField(10)
  bool deleted;
  @HiveField(11)
  bool archived;
  @HiveField(12)
  bool isDone;
  Todo({
    required this.createdTime,
    required this.taskName,
    required this.priority,
    required this.id,
    required this.folder,
    this.dueDate = '',
    this.notes = '',
    this.recurring = 'periodic',
    required this.subtasks,
    required this.dep,
    this.archived = false,
    this.deleted = false,
    this.isDone = false,
  });
}

class IdClass {
  int generate() => Random().nextInt(99999);
}
