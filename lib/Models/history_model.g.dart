// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class historymodelAdapter extends TypeAdapter<history_model> {
  @override
  final int typeId = 0;

  @override
  history_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return history_model(
      category: fields[0] as String,
      numberResult: fields[1] as String,
      englishResult: fields[2] as String,
      remark: fields[3] as String,
      date: fields[4] as String,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, history_model obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.numberResult)
      ..writeByte(2)
      ..write(obj.englishResult)
      ..writeByte(3)
      ..write(obj.remark)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is historymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
