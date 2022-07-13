import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'jogador.g.dart';

@HiveType(typeId: 2)
class Jogador {
  @HiveField(0)
  String nome;
  @HiveField(1)
  double saldo;
  Color? cor;
  @HiveField(2)
  String colorHex = '';

  Jogador(this.nome, this.saldo);
}
