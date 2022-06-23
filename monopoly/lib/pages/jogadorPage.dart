import 'package:flutter/material.dart';
import 'package:monopoly/models/jogador.dart';

class JogadorPage extends StatefulWidget {
  Jogador jogador;
  JogadorPage({Key? key, required this.jogador}) : super(key: key);

  @override
  State<JogadorPage> createState() => _JogadorPageState();
}

class _JogadorPageState extends State<JogadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ações"),
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
        ],
      ),
    );
  }
}
