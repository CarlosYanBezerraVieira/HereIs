// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CepModelAdapter extends TypeAdapter<CepModel> {
  @override
  final int typeId = 0;

  @override
  CepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CepModel(
      cep: fields[0] as String,
      street: fields[1] as String,
      city: fields[2] as String,
      uf: fields[3] as String,
      neighborhood: fields[4] as String,
      complement: fields[5] as String,
      ddd: fields[6] as String,
      isFavorite: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CepModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.cep)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.uf)
      ..writeByte(4)
      ..write(obj.neighborhood)
      ..writeByte(5)
      ..write(obj.complement)
      ..writeByte(6)
      ..write(obj.ddd)
      ..writeByte(7)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
