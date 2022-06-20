import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeJogo extends StatefulWidget {
  const HomeJogo({Key? key}) : super(key: key);

  @override
  State<HomeJogo> createState() => _HomeJogoState();
}

class _HomeJogoState extends State<HomeJogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo"),
      ),
      body: const Text("HomeJogo"),
    );
  }
}
