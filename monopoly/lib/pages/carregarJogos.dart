import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../repositorio/jogadoresRepository.dart';
import 'homeJogo.dart';

class CarregarJogos extends StatefulWidget {
  const CarregarJogos({Key? key}) : super(key: key);

  @override
  State<CarregarJogos> createState() => _CarregarJogosState();
}

class _CarregarJogosState extends State<CarregarJogos> {
  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carregar Jogos"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: repositorio.jogos.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onLongPress: () {
                            Get.defaultDialog(
                              middleText:
                                  "O jogo ${repositorio.jogos[index].nomeJogo} será removido",
                              titleStyle: TextStyle(color: Colors.red),
                              title: "Excluir Jogo?",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                repositorio
                                    .excluirJogo(repositorio.jogos[index]);
                                Get.back();
                              },
                              textCancel: "Cancelar",
                              onCancel: () {},
                            );
                          },
                          onTap: () {
                            Get.offAll(() => HomeJogo(
                                  indexJogo: index,
                                ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 35,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text(
                              repositorio.jogos[index].nomeJogo.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'KabelBd',
                                fontSize: 26,
                                shadows: <Shadow>[
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
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
