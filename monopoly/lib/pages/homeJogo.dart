import 'package:flutter/material.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';

import '../models/jogo.dart';

class HomeJogo extends StatefulWidget {
  int indexJogo;
  HomeJogo({Key? key, required this.indexJogo}) : super(key: key);

  @override
  State<HomeJogo> createState() => _HomeJogoState();
}

class _HomeJogoState extends State<HomeJogo> {
  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    Jogo jogoHome = repositorio.jogos[widget.indexJogo];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Jogo"),
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: jogoHome.listaJogadores.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onLongPress: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width - 35,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                color: jogoHome.listaJogadores[index].cor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
