import 'package:flutter/material.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/jogo.dart';

class JogosRepositorio with ChangeNotifier {
  List<Jogo> _jogo = [];

  List<Jogo> get jogos => _jogo;

  void adicionarJogador(Jogo jogo, String nome, double saldo, Color cor) {
    jogo.listaJogadores.add(Jogador(nome, saldo, cor));
    notifyListeners();
  }

  void deletarJogador(Jogador jogador, Jogo jogo) {
    jogo.listaJogadores.remove(jogador);
    notifyListeners();
  }

  void editarJogador(Jogador jogador, String nome) {
    jogador.nome = nome;
    notifyListeners();
  }

  void criarJogo(String nomeJogo, List<Jogador> listaJogadores, double salario,
      double salarioInicial) {
    jogos.add(Jogo(nomeJogo, listaJogadores, salario, salarioInicial));
    notifyListeners();
  }
}
