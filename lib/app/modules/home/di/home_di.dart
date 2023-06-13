import 'package:flutter_modular/flutter_modular.dart';

import '../pages/home/home_page.dart';
import '../routes/home_routes.dart';
import '../services/interfaces/iroute_service.dart';
import '../services/route_service.dart';
import '../stores/home_store.dart';

class HomeDI {
  static List<Bind<Object>> get binds => [
    Bind.lazySingleton<IRouteService>((i) => RouteService(i())),
    Bind.lazySingleton((i) => HomeStore(i())),
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(HomeRoutes.home, child: (context, args) => const HomePage()),
  ];
}