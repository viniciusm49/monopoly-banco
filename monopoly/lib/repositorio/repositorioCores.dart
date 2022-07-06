import 'package:flutter/material.dart';

class CoresRepositorio {
  final List<Color> _listaDeCores = [
    const Color.fromARGB(255, 17, 195, 201),
    const Color.fromARGB(255, 241, 146, 3),
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.pink,
    Colors.grey,
    Colors.brown,
  ];
  List<Color> get cores => _listaDeCores;
}
