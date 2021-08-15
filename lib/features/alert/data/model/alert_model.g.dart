// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertModelAdapter extends TypeAdapter<AlertModel> {
  @override
  final int typeId = 1;

  @override
  AlertModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlertModel(
      coindID: fields[1] as String,
      targetPrice: fields[2] as num,
    );
  }

  @override
  void write(BinaryWriter writer, AlertModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.coindID)
      ..writeByte(2)
      ..write(obj.targetPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
