import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:monopoly/configs/colorString.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/jogo.dart';

class JogosRepositorio with ChangeNotifier {
  late LazyBox box;
  List<Jogo> _jogo = [];

  JogosRepositorio() {
    _startRepository();
  }
  _startRepository() async {
    await _startBox();
    await _lerJogos();
  }

  _startBox() async {
    Hive.registerAdapter(JogoAdapter());
    Hive.registerAdapter(JogadorAdapter());
    box = await Hive.openLazyBox<Jogo>('jogos2');
    print(box.keys);
  }

  _lerJogos() async {
    for (int index = 0; index < box.length; index++) {
      _jogo.add(await box.getAt(index));
      _jogo[index].listaJogadores.forEach(
            (jogador) => jogador.cor = HexColor.fromHex(jogador.colorHex),
          );
      notifyListeners();
    }
  }

  List<Jogo> get jogos => _jogo;

  void criarJogo(String nomeJogo, List<Jogador> listaJogadores, double salario,
      double salarioInicial) async {
    jogos.add(Jogo(nomeJogo, listaJogadores, salario, salarioInicial));
    await box.put(jogos.last.nomeJogo, jogos.last);
    notifyListeners();
  }

  Future<void> receberSalario(Jogador jogador, Jogo jogo) async {
    jogador.saldo += jogo.salario;
    jogo.historico.add("Salário pago a ${jogador.nome}");
    await box.put(jogo.nomeJogo, jogo);
    notifyListeners();
  }

  Future<void> transferenciaJogador(
      Jogador pagador, Jogador recebedor, double valor, Jogo jogo) async {
    pagador.saldo -= valor;
    recebedor.saldo += valor;
    jogo.historico
        .add("${pagador.nome} transferiu \$$valor para ${recebedor.nome}");
    await box.put(jogo.nomeJogo, jogo);
    notifyListeners();
  }

  Future<void> pagarBanco(Jogador pagador, double valor, Jogo jogo) async {
    pagador.saldo -= valor;
    jogo.historico.add("${pagador.nome} pagou \$$valor ao banco");
    await box.put(jogo.nomeJogo, jogo);
    notifyListeners();
  }

  Future<void> pagarTodos(Jogador pagador, double valor, Jogo jogo) async {
    pagador.saldo -= valor * (jogo.listaJogadores.length);
    for (var element in jogo.listaJogadores) {
      element.saldo += valor;
    }
    jogo.historico.add("${pagador.nome} pagou \$$valor a todos");
    await box.put(jogo.nomeJogo, jogo);
    notifyListeners();
  }

  Future<void> receberBanco(Jogador jogador, double valor, Jogo jogo) async {
    jogador.saldo += valor;
    jogo.historico.add("${jogador.nome} recebeu \$$valor do banco");
    await box.put(jogo.nomeJogo, jogo);
    notifyListeners();
  }

  Future<void> excluirJogo(Jogo jogo) async {
    jogos.remove(jogo);
    await box.delete(jogo.nomeJogo);
    notifyListeners();
  }
}
