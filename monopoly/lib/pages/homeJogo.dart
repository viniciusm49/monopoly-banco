import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/pages/InicioEscolha.dart';
import 'package:monopoly/pages/jogadorPage.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';

import '../models/jogo.dart';

class HomeJogo extends StatefulWidget {
  final int indexJogo;
  const HomeJogo({Key? key, required this.indexJogo}) : super(key: key);

  @override
  State<HomeJogo> createState() => _HomeJogoState();
}

class _HomeJogoState extends State<HomeJogo> {
  void jogarDados() {
    final random = Random();
    List<String> imagensDado = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
      "assets/images/5.png",
      "assets/images/6.png",
    ];
    int dado1 = random.nextInt(6);
    int dado2 = random.nextInt(6);
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagensDado[dado1]),
                    const SizedBox(
                      width: 35,
                    ),
                    Image.asset(imagensDado[dado2]),
                  ],
                ),
                Text(
                  "${dado1 + dado2 + 2}",
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }

  void mostraHistorico(Jogo jogo) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 600,
            color: Colors.white,
            child: ListView.builder(
                itemCount: jogo.historico.length,
                itemBuilder: (context, int index) {
                  List<String> lista = jogo.historico.reversed.toList();
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 9,
                              offset: const Offset(1, 1),
                            ),
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lista[index],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    Jogo jogoHome = repositorio.jogos[widget.indexJogo];
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: const Offset(1, 1),
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.off(() => const InicioEscolha());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          mostraHistorico(jogoHome);
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.history,
                                size: 40,
                                color: Colors.red,
                              ),
                              Text(
                                "Histórico",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          jogarDados();
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.play_circle,
                                size: 40,
                                color: Colors.red,
                              ),
                              Text(
                                "Jogar Dados",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: jogoHome.listaJogadores.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => JogadorPage(
                                    jogador: jogoHome.listaJogadores[index],
                                    jogo: jogoHome,
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 35,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                color: jogoHome.listaJogadores[index].cor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      jogoHome.listaJogadores[index].nome
                                          .toUpperCase(),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        //fontFamily: 'KabelBd',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 5.0,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ],
                                      )),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                      "\$${jogoHome.listaJogadores[index].saldo.toInt()}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 5.0,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ],
                                      )),
                                  const SizedBox(
                                    width: 13,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
