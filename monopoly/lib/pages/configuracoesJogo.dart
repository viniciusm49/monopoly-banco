import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                height: 220,
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
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Pagamento ao passar pelo Início",
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
                        validator: (valorJogador) {
                          if (valorJogador == null || valorJogador.isEmpty) {
                            return 'Digite algum numero';
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Começar",
                            style: TextStyle(
                              fontSize: 20,
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
