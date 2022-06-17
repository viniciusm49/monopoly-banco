// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/pages/configuracoesJogo.dart';
import 'package:monopoly/repositorio/repositorioCores.dart';

class CadastroJogo extends StatefulWidget {
  String nomeJogo;
  CadastroJogo({Key? key, required this.nomeJogo}) : super(key: key);

  @override
  State<CadastroJogo> createState() => _CadastroJogoState();
}

class _CadastroJogoState extends State<CadastroJogo> {
  List<Jogador> listaController = [];
  var coresJogadores = CoresRepositorio();
  var nomeJogador = TextEditingController();

  void adicionarJogador(String nomeJogador) {
    final _random = Random();
    listaController.add(Jogador(
        nomeJogador,
        0,
        coresJogadores.cores
            .removeAt(_random.nextInt(coresJogadores.cores.length))));
    Get.back();
    setState(() {});
  }

  void removerJogador(Jogador jogador) {
    coresJogadores.cores.add(jogador.cor);
    listaController.remove(jogador);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro de Jogadores"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 5,
                          color: Colors.white,
                          style: BorderStyle.solid), //BorderSide
                      bottom: BorderSide(
                          width: 5,
                          color: Colors.white,
                          style: BorderStyle.solid), //BorderSide
                      left: BorderSide(
                          width: 5,
                          color: Colors.white,
                          style: BorderStyle.solid), //Borderside
                      right: BorderSide(
                          width: 5,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  widget.nomeJogo.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KabelBd',
                    fontSize: 26,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 240, 234),
                            title: const Text(
                              'Digite o nome do jogador',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextField(
                                  controller: nomeJogador,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nome do Jogador',
                                    hintText: 'Ex: Vinicius',
                                  ),
                                  maxLength: 12,
                                  autofocus: true,
                                  onEditingComplete: () {
                                    adicionarJogador(nomeJogador.text);
                                    nomeJogador.clear();
                                  },
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("CANCELAR")),
                                  TextButton(
                                      onPressed: () {
                                        adicionarJogador(nomeJogador.text);
                                        nomeJogador.clear();
                                      },
                                      child: const Text("OK")),
                                ],
                              )
                            ],
                          ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Adicionar Jogador',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'KabelBd',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: listaController.length,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onLongPress: () {
                              Get.defaultDialog(
                                middleText:
                                    "O jogador ${listaController[index].nome} será removido",
                                titleStyle: TextStyle(color: Colors.red),
                                title: "Excluir jogador?",
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  removerJogador(listaController[index]);
                                  Get.back();
                                },
                                textCancel: "Cancelar",
                                onCancel: () {},
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 35,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.red,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      listaController[index].nome.toUpperCase(),
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        //fontFamily: 'KabelBd',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        shadows: const <Shadow>[
                                          Shadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 5.0,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ],
                                      )),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: listaController[index].cor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(12)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(ConfiguracaoPartida(
                        listaFinal: listaController,
                        nomeJogo: widget.nomeJogo));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Próximo",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
