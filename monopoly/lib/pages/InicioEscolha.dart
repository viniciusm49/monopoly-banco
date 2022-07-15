import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/pages/cadastroJogo.dart';
import 'package:monopoly/pages/carregarJogos.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';

class InicioEscolha extends StatefulWidget {
  const InicioEscolha({Key? key}) : super(key: key);

  @override
  State<InicioEscolha> createState() => _InicioEscolhaState();
}

void enviarNome(String nome) {
  String nome1 = nome;
  Get.back();
  Get.to(() => CadastroJogo(
        nomeJogo: nome1,
      ));
}

class _InicioEscolhaState extends State<InicioEscolha> {
  var nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              border: const Border(
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
                      width: 5, color: Colors.white, style: BorderStyle.solid)),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: const Center(
                child: Text(
              'GERENTE\nMONOPOLY',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'KabelBd',
                fontSize: 35,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.5, 0.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            )),
          ),
        ),
        const SizedBox(
          height: 110,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 240, 234),
                            title: const Text(
                              'Digite o nome da partida',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextField(
                                  controller: nome,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nome da partida',
                                    hintText: 'Ex: Jogo dos Amigos',
                                    semanticCounterText: 'Teste',
                                  ),
                                  onEditingComplete: () {
                                    enviarNome(nome.text);
                                    nome.clear();
                                  },
                                  maxLength: 15,
                                  autofocus: true,
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
                                        if (nome.text.isEmpty) {
                                          Get.rawSnackbar(
                                              messageText: const Text(
                                            'Nome não pode está vazio',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ));
                                        } else {
                                          enviarNome(nome.text);
                                          nome.clear();
                                        }
                                      },
                                      child: const Text("OK")),
                                ],
                              )
                            ],
                          ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Novo Jogo",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print(repositorio.box.keys);
                  Get.to(() => const CarregarJogos());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Carregar Jogos",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
