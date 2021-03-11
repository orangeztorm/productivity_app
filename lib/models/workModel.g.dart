// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkModelAdapter extends TypeAdapter<WorkModel> {

@override
  final typeId = 1;

  @override
  WorkModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkModel(
      title: fields[0] as String,
      minutes: fields[1] as String,
      discription: fields[2] as String,
      done: fields[3] as bool,
      percent: fields[4] as double,
      dateAdded: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.minutes)
      ..writeByte(2)
      ..write(obj.discription)
      ..writeByte(3)
      ..write(obj.done)
      ..writeByte(4)
      ..write(obj.percent)
      ..writeByte(5)
      ..write(obj.dateAdded);
  }
}
