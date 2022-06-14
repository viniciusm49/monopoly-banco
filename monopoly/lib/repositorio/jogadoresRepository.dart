import 'package:flutter/material.dart';
import 'package:monopoly/models/jogador.dart';

class JogadoresRepositorio with ChangeNotifier {
  List<Jogador> _jogadores = [];

  List<Jogador> get jogadores => _jogadores;

  void adicionarJogador(String nome, double saldo) {
    jogadores.add(Jogador(nome, saldo));
    notifyListeners();
  }

  void deletarJogador(Jogador jogador) {
    jogadores.remove(jogador);
    notifyListeners();
  }

  void editarJogador(Jogador jogador, String nome) {
    jogador.nome = nome;
    notifyListeners();
  }
}
