import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/pages/cadastroJogo.dart';

class InicioEscolha extends StatefulWidget {
  const InicioEscolha({Key? key}) : super(key: key);

  @override
  State<InicioEscolha> createState() => _InicioEscolhaState();
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
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        backgroundColor:
                            const Color.fromARGB(255, 241, 240, 234),
                        title: const Text(
                          'Digite o nome da partida',
                          style: TextStyle(color: Colors.red),
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
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                            width: 12,
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
                                    Get.to(() => const CadastroJogo());
                                  },
                                  child: const Text("OK")),
                            ],
                          )
                        ],
                      ));
            },
            child: const Text("Novo jogo"),
          ),
        ),
      ],
    ));
  }
}
