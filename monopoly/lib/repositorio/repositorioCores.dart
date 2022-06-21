import 'package:flutter/material.dart';

class CoresRepositorio {
  final List<Color> _listaDeCores = [
    Colors.amber,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.pink
  ];
  List<Color> get cores => _listaDeCores;
}
