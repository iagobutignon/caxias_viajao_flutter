import 'package:caxias_viajao_flutter/app/modules/shared/di/shared_di.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  final List<Bind> binds = [
    ...SharedDI.binds,
  ];
}