// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:monopoly/models/jogador.dart';

class CadastroJogo extends StatefulWidget {
  String nomeJogo;
  CadastroJogo({Key? key, required this.nomeJogo}) : super(key: key);

  @override
  State<CadastroJogo> createState() => _CadastroJogoState();
}

class _CadastroJogoState extends State<CadastroJogo> {
  List<Jogador> listaController = [];
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
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  widget.nomeJogo.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KabelBd',
                    fontSize: 28,
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
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
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
                  'Adicionar jogador',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    //fontFamily: 'KabelBd',
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}
