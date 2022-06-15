import 'package:monopoly/models/jogador.dart';

class Jogo {
  String nomeJogo;
  List<Jogador> listaJogadores;
  double salario;
  double salarioInicial;

  Jogo(this.nomeJogo, this.listaJogadores, this.salario, this.salarioInicial);
}
