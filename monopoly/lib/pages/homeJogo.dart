import 'package:flutter/material.dart';
import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo"),
      ),
      body: const Text("HomeJogo"),
    );
  }
}
