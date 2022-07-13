// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jogo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JogoAdapter extends TypeAdapter<Jogo> {
  @override
  final int typeId = 1;

  @override
  Jogo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jogo(
      fields[0] as String,
      (fields[1] as List).cast<Jogador>(),
      fields[2] as double,
      fields[3] as double,
    )..historico = (fields[4] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Jogo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nomeJogo)
      ..writeByte(1)
      ..write(obj.listaJogadores)
      ..writeByte(2)
      ..write(obj.salario)
      ..writeByte(3)
      ..write(obj.salarioInicial)
      ..writeByte(4)
      ..write(obj.historico);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JogoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
