import 'package:flutter/material.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/jogo.dart';

class JogosRepositorio with ChangeNotifier {
  List<Jogo> _jogo = [];

  List<Jogo> get jogos => _jogo;

  void criarJogo(String nomeJogo, List<Jogador> listaJogadores, double salario,
      double salarioInicial) {
    jogos.add(Jogo(nomeJogo, listaJogadores, salario, salarioInicial));
    notifyListeners();
  }

  void receberSalario(Jogador jogador, Jogo jogo) {
    jogador.saldo += jogo.salario;
    jogo.historico.add("Salário pago a ${jogador.nome}");
    notifyListeners();
  }

  void transferenciaJogador(
      Jogador pagador, Jogador recebedor, double valor, Jogo jogo) {
    pagador.saldo -= valor;
    recebedor.saldo += valor;
    jogo.historico.add(
        "Tranfêrencia no valor de $valor de ${pagador.nome} para ${recebedor.nome}");
    notifyListeners();
  }

  void pagarBanco(Jogador pagador, double valor, Jogo jogo) {
    pagador.saldo -= valor;
    jogo.historico.add("${pagador.nome} pagou $valor ao banco");
    notifyListeners();
  }

  void pagarTodos(Jogador pagador, double valor, Jogo jogo) {
    pagador.saldo -= valor * (jogo.listaJogadores.length);
    for (var element in jogo.listaJogadores) {
      element.saldo += valor;
    }
    jogo.historico.add("${pagador.nome} pagou $valor a todos");
    notifyListeners();
  }

  void receberBanco(Jogador jogador, double valor, Jogo jogo) {
    jogador.saldo += valor;
    jogo.historico.add("${jogador.nome} recebeu $valor do banco");
    notifyListeners();
  }
}
