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

  void criarJogo(String nomeJogo, List<Jogador> listaJogadores, double salario,
      double salarioInicial) {
    jogos.add(Jogo(nomeJogo, listaJogadores, salario, salarioInicial));
    notifyListeners();
  }

  void receberSalario(Jogador jogador, Jogo jogo) {
    jogador.saldo += jogo.salario;
    notifyListeners();
  }

  void transferenciaJogador(Jogador pagador, Jogador recebedor, double valor) {
    pagador.saldo -= valor;
    recebedor.saldo += valor;
    notifyListeners();
  }

  void pagarBanco(Jogador pagador, double valor) {
    pagador.saldo -= valor;
    notifyListeners();
  }

  void pagarTodos(Jogador pagador, double valor, Jogo jogo) {
    pagador.saldo -= valor * (jogo.listaJogadores.length);
    for (var element in jogo.listaJogadores) {
      element.saldo += valor;
    }
    notifyListeners();
  }

  void receberBanco(Jogador jogador, double valor) {
    jogador.saldo += valor;
    notifyListeners();
  }
}
