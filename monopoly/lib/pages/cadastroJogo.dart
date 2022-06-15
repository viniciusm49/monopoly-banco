// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CadastroJogo extends StatefulWidget {
  const CadastroJogo({Key? key}) : super(key: key);

  @override
  State<CadastroJogo> createState() => _CadastroJogoState();
}

class _CadastroJogoState extends State<CadastroJogo> {
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
                            width: 6,
                            color: Colors.white,
                            style: BorderStyle.solid), //BorderSide
                        bottom: BorderSide(
                            width: 6,
                            color: Colors.white,
                            style: BorderStyle.solid), //BorderSide
                        left: BorderSide(
                            width: 6,
                            color: Colors.white,
                            style: BorderStyle.solid), //Borderside
                        right: BorderSide(
                            width: 6,
                            color: Colors.white,
                            style: BorderStyle.solid)),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.red),
              ),
            )
          ],
        ));
  }
}
