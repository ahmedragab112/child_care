// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mom_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MomDataModeAdapter extends TypeAdapter<MomDataMode> {
  @override
  final int typeId = 2;

  @override
  MomDataMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MomDataMode(
      name: fields[0] as String?,
      phoneNumber: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MomDataMode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MomDataModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
