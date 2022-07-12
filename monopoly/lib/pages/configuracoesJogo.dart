import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/models/jogo.dart';
import 'package:monopoly/pages/homeJogo.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';

import '../models/jogador.dart';

class ConfiguracaoPartida extends StatefulWidget {
  List<Jogador> listaFinal;
  String nomeJogo;
  ConfiguracaoPartida(
      {Key? key, required this.listaFinal, required this.nomeJogo})
      : super(key: key);

  @override
  State<ConfiguracaoPartida> createState() => _ConfiguracaoPartidaState();
}

class _ConfiguracaoPartidaState extends State<ConfiguracaoPartida> {
  final key = GlobalKey<FormState>();
  final valorSalario = TextEditingController();
  final valorJogador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações da Partida"),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Saldo Inicial dos Jogadores",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        controller: valorJogador,
                        decoration: const InputDecoration(
                            labelText: 'Saldo Inicial',
                            hintText: 'Ex. 1500',
                            icon: Icon(Icons.account_balance_wallet_rounded),
                            iconColor: Colors.red),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        validator: (valorJogador) {
                          if (valorJogador == null || valorJogador.isEmpty) {
                            return 'Digite algum numero';
                          } else if (!(int.tryParse(valorJogador) != null)) {
                            return 'Apenas números';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Pagamento ao Passar pelo Início",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        controller: valorSalario,
                        decoration: const InputDecoration(
                            labelText: 'Salário',
                            hintText: 'Ex. 200',
                            icon: Icon(Icons.monetization_on_outlined),
                            iconColor: Colors.red),
                        keyboardType: TextInputType.number,
                        validator: (valorSalario) {
                          if (valorSalario == null || valorSalario.isEmpty) {
                            return 'Digite algum numero';
                          } else if (!(int.tryParse(valorSalario) != null)) {
                            return 'Apenas números';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      // if (key.currentState!.validate()) {
                      //   for (var ok in widget.listaFinal) {
                      //     ok.saldo = double.parse(valorJogador.text);
                      //   }
                      //   repositorio.jogos.add(Jogo(
                      //       widget.nomeJogo,
                      //       widget.listaFinal,
                      //       double.parse(valorSalario.text),
                      //       double.parse(valorJogador.text)));
                      //   int numeroJogo = repositorio.jogos.length - 1;
                      //   Get.offAll(() => HomeJogo(
                      //         indexJogo: numeroJogo,
                      //       ));
                      // } else {
                      //   Get.rawSnackbar(
                      //     duration: const Duration(seconds: 1),
                      //     messageText: const Text(
                      //       "Valores Invalidos",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   );
                      // }
                      print(repositorio.box.get('teste'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Começar",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
