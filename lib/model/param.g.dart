// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParamsAdapter extends TypeAdapter<Params> {
  @override
  final int typeId = 0;

  @override
  Params read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Params(
      name: fields[0] as String,
      valuePro: fields[1] as int,
      color: fields[2] as String,
      imageUrl: fields[3] as String,
      isPremium: fields[4] as String,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Params obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.valuePro)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.isPremium)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
