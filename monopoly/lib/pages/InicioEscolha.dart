import 'package:flutter/material.dart';

class InicioEscolha extends StatefulWidget {
  const InicioEscolha({Key? key}) : super(key: key);

  @override
  State<InicioEscolha> createState() => _InicioEscolhaState();
}

class _InicioEscolhaState extends State<InicioEscolha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Novo jogo"),
          ),
        ),
      ],
    ));
  }
}
