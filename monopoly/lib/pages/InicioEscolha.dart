import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/pages/cadastroJogo.dart';

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
    return Scaffold(
        body: Column(
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
                              color: Colors.red, fontWeight: FontWeight.bold),
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
                                    enviarNome(nome.text);
                                    nome.clear();
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
                    "Novo jogo",
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
    ));
  }
}
