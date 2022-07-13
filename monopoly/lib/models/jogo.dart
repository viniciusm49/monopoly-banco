import 'package:hive/hive.dart';
import 'package:monopoly/models/jogador.dart';

part 'jogo.g.dart';

@HiveType(typeId: 1)
class Jogo extends HiveObject {
  @HiveField(0)
  String nomeJogo = '';
  @HiveField(1)
  List<Jogador> listaJogadores = [];
  @HiveField(2)
  double salario = 0;
  @HiveField(3)
  double salarioInicial = 0;
  @HiveField(4)
  List<String> historico = [];

  Jogo(this.nomeJogo, this.listaJogadores, this.salario, this.salarioInicial);
}
