import 'package:flutter/material.dart';
import 'package:monopoly/pages/InicioEscolha.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 137, 245, 193),
      ),
      home: const InicioEscolha(),
    );
  }
}
