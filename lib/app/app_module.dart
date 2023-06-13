import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/shared/shared_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    SharedModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];

}