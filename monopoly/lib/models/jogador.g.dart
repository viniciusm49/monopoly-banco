// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jogador.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JogadorAdapter extends TypeAdapter<Jogador> {
  @override
  final int typeId = 2;

  @override
  Jogador read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jogador(
      fields[0] as String,
      fields[1] as double,
    )..colorHex = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Jogador obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.saldo)
      ..writeByte(2)
      ..write(obj.colorHex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JogadorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
