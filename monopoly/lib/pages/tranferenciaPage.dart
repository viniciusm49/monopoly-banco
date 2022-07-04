import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/pages/homeJogo.dart';
import 'package:provider/provider.dart';
import '../models/jogo.dart';
import '../repositorio/jogadoresRepository.dart';

class TranferenciaPage extends StatefulWidget {
  Jogo jogo;
  Jogador jogador;
  TranferenciaPage({Key? key, required this.jogo, required this.jogador})
      : super(key: key);

  @override
  State<TranferenciaPage> createState() => _TranferenciaPageState();
}

class _TranferenciaPageState extends State<TranferenciaPage> {
  final valor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagar"),
        backgroundColor: widget.jogador.cor,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: widget.jogador.cor,
              child: const Center(
                child: Text(
                  "Enviar para?",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Qual valor?",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                TextField(
                                  cursorColor: Colors.black,
                                  controller: valor,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Valor a pagar a todos',
                                    hintText: 'Digite o valor',
                                    semanticCounterText: 'Teste',
                                  ),
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final valorPassado =
                                        double.tryParse(valor.text);
                                    if (valorPassado != null) {
                                      if (valorPassado <=
                                          widget.jogador.saldo) {
                                        repositorio.pagarTodos(widget.jogador,
                                            valorPassado, widget.jogo);
                                        valor.clear();
                                        Get.back();
                                        Get.back();
                                        Get.back();
                                        Get.rawSnackbar(
                                            title: "Tá Pago",
                                            backgroundColor: Colors.green,
                                            messageText: Text(
                                              "\$$valorPassado foram enviados a todos o jogadores",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ));
                                      } else {
                                        Get.rawSnackbar(
                                            title: "Sem Saldo",
                                            messageText: const Text(
                                              "Saldo insuficiente para essa transação",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ));
                                      }
                                    } else {
                                      Get.rawSnackbar(
                                          title: "Erro",
                                          messageText: const Text(
                                            "Valor invalido",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ));
                                    }
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Pagar",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
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
                        blurRadius: 8,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.group,
                        size: 40,
                        color: Colors.black,
                      ),
                      Text(
                        "Todos",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Qual valor?",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                TextField(
                                  cursorColor: Colors.black,
                                  controller: valor,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Valor a pagar ao banco',
                                    hintText: 'Digite o valor',
                                    semanticCounterText: 'Teste',
                                  ),
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final valorPassado =
                                        double.tryParse(valor.text);
                                    if (valorPassado != null) {
                                      if (valorPassado <=
                                          widget.jogador.saldo) {
                                        repositorio.pagarBanco(
                                            widget.jogador, valorPassado);
                                        valor.clear();
                                        Get.back();
                                        Get.back();
                                        Get.back();
                                        Get.rawSnackbar(
                                            backgroundColor: Colors.green,
                                            title: "Tá Pago",
                                            messageText: Text(
                                              "\$$valorPassado foram pagos ao Banco",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ));
                                      } else {
                                        Get.rawSnackbar(
                                            title: "Sem Saldo",
                                            messageText: const Text(
                                              "Saldo insuficiente para essa transação",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ));
                                      }
                                    } else {
                                      Get.rawSnackbar(
                                          title: "Erro",
                                          messageText: const Text(
                                            "Valor invalido",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ));
                                    }
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Pagar",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
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
                        blurRadius: 8,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.account_balance,
                        size: 40,
                        color: Colors.black,
                      ),
                      Text(
                        "Banco",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: widget.jogo.listaJogadores.length,
                itemBuilder: (context, int index) {
                  if (widget.jogo.listaJogadores[index] == widget.jogador) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Qual valor?",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        TextField(
                                          cursorColor: Colors.black,
                                          controller: valor,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            labelText:
                                                'Valor a enviar para ${widget.jogo.listaJogadores[index].nome}',
                                            hintText: 'Digite o valor',
                                            semanticCounterText: 'Teste',
                                          ),
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            final valorPassado =
                                                double.tryParse(valor.text);
                                            if (valorPassado != null) {
                                              if (valorPassado <=
                                                  widget.jogador.saldo) {
                                                repositorio
                                                    .transferenciaJogador(
                                                        widget.jogador,
                                                        widget.jogo
                                                                .listaJogadores[
                                                            index],
                                                        valorPassado);
                                                valor.clear();
                                                Get.back();
                                                Get.back();
                                                Get.back();
                                                Get.rawSnackbar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    title: "Tá Pago",
                                                    messageText: Text(
                                                      "\$$valorPassado foram enviados a ${widget.jogo.listaJogadores[index].nome}",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ));
                                              } else {
                                                Get.rawSnackbar(
                                                    title: "Sem Saldo",
                                                    messageText: const Text(
                                                      "Saldo insuficiente para essa transação",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ));
                                              }
                                            } else {
                                              Get.rawSnackbar(
                                                  title: "Erro",
                                                  messageText: const Text(
                                                    "Valor invalido",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ));
                                            }
                                          },
                                          // ignore: sort_child_properties_last
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Pagar",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 35,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: widget.jogo.listaJogadores[index].cor,
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
                                    widget.jogo.listaJogadores[index].nome
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
                                    "\$${widget.jogo.listaJogadores[index].saldo.toInt()}",
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
        ],
      ),
    );
  }
}
