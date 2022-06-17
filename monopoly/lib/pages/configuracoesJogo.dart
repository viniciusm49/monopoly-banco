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
            children: [
              TextFormField(
                controller: valorJogador,
                decoration: const InputDecoration(
                    labelText: 'Salário Inicial', hintText: 'Ex. 1500'),
                keyboardType: TextInputType.number,
                validator: (valorJogador) {
                  if (valorJogador == null || valorJogador.isEmpty) {
                    return 'Digite algum numero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: valorSalario,
                decoration: const InputDecoration(
                    labelText: 'Salário', hintText: 'Ex. 200'),
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
    );
  }
}
