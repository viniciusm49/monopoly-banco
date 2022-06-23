import 'package:flutter/material.dart';

class CoresRepositorio {
  final List<Color> _listaDeCores = [
    Color.fromARGB(255, 17, 195, 201),
    const Color.fromARGB(255, 241, 146, 3),
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.pink
  ];
  List<Color> get cores => _listaDeCores;
}
