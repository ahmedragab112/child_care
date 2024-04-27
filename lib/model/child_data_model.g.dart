// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChildDataModelAdapter extends TypeAdapter<ChildDataModel> {
  @override
  final int typeId = 1;

  @override
  ChildDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChildDataModel(
      name: fields[0] as String?,
      age: fields[1] as String?,
      imagePath: fields[2] as String?,
      isMeal: fields[3] as bool?,
      date: fields[4] as String?,
      bloodType: fields[5] as String?,
      fatherName: fields[6] as String?,
      fatherPhone: fields[7] as String?,
      id: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChildDataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.isMeal)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.bloodType)
      ..writeByte(6)
      ..write(obj.fatherName)
      ..writeByte(7)
      ..write(obj.fatherPhone)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
