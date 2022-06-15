import 'package:monopoly/repositorio/jogadoresRepository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider<JogosRepositorio>(
    create: (context) => JogosRepositorio(),
  ),
];
