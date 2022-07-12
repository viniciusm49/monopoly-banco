import 'package:hive/hive.dart';
import 'package:monopoly/models/jogador.dart';

@HiveType(typeId: 0)
class Jogo extends HiveObject {
  @HiveField(0)
  int id = 0;
  @HiveField(1)
  String nomeJogo = '';
  @HiveField(2)
  List<Jogador> listaJogadores = [];
  @HiveField(3)
  double salario = 0;
  @HiveField(4)
  double salarioInicial = 0;
  @HiveField(5)
  List<String> historico = [];

  Jogo(this.nomeJogo, this.listaJogadores, this.salario, this.salarioInicial);
}
