import 'package:flutter_modular/flutter_modular.dart';

import '../services/graph_service.dart';
import '../services/http_service.dart';
import '../services/interfaces/igraph_service.dart';
import '../services/interfaces/ihttp_service.dart';

class SharedDI {
  static List<Bind<Object>> get binds => [
    Bind.lazySingleton<IHttpService>((i) => HttpService(), export: true),
    Bind.lazySingleton<IGraphService>((i) => GraphService(), export: true),
  ];
}