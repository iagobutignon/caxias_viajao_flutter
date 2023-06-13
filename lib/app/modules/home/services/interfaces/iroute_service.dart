import '../../model/routes_model.dart';

abstract class IRouteService {
  Future<RoutesModel> getRoutes(String name, String data, bool useCache);
}