import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/pages/tranferenciaPage.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';
import '../models/jogo.dart';

class JogadorPage extends StatefulWidget {
  Jogador jogador;
  Jogo jogo;
  JogadorPage({Key? key, required this.jogador, required this.jogo})
      : super(key: key);

  @override
  State<JogadorPage> createState() => _JogadorPageState();
}

class _JogadorPageState extends State<JogadorPage> {
  @override
  Widget build(BuildContext context) {
    JogosRepositorio repositorio = context.watch<JogosRepositorio>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ações"),
        backgroundColor: widget.jogador.cor,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              // borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: widget.jogador.cor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text("Saldo \$${widget.jogador.saldo}",
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    //fontFamily: 'KabelBd',
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 78, 71, 71),
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(widget.jogador.nome.toUpperCase(),
                  maxLines: 2,
                  style: TextStyle(
                    color: widget.jogador.cor,
                    //fontFamily: 'KabelBd',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_downward_sharp,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        "Receber",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TranferenciaPage(
                      jogo: widget.jogo, jogador: widget.jogador));
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.send_to_mobile_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        "Pagar",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              repositorio.receberSalario(widget.jogador, widget.jogo);
              Get.back();
            },
            child: Container(
              width: 320,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: const Color.fromARGB(255, 230, 214, 0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.attach_money_sharp,
                    size: 60,
                  ),
                  Text(
                    "Receber Salário",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}