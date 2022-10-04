// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      createdTime: fields[1] as DateTime,
      taskName: fields[2] as String,
      priority: fields[4] as String,
      id: fields[0] as int,
      folder: fields[3] as String,
      dueDate: fields[5] as String,
      notes: fields[6] as String,
      recurring: fields[7] as String,
      subtasks: (fields[8] as List).cast<String>(),
      dep: (fields[9] as List).cast<int>(),
      archived: fields[11] as bool,
      deleted: fields[10] as bool,
      isDone: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdTime)
      ..writeByte(2)
      ..write(obj.taskName)
      ..writeByte(3)
      ..write(obj.folder)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.dueDate)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.recurring)
      ..writeByte(8)
      ..write(obj.subtasks)
      ..writeByte(9)
      ..write(obj.dep)
      ..writeByte(10)
      ..write(obj.deleted)
      ..writeByte(11)
      ..write(obj.archived)
      ..writeByte(12)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
