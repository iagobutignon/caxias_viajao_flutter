import '../../shared/services/interfaces/ihttp_service.dart';
import '../model/routes_model.dart';
import 'interfaces/iroute_service.dart';

class RouteService implements IRouteService {
  final IHttpService _httpService;

  RouteService(this._httpService);

  @override
  Future<RoutesModel> getRoutes(String name, String data, bool useCache) async {
    final Map<String, dynamic> json = {
      'name': name,
      'data': data,
      'cache': useCache,
    };

    final result = await _httpService.post(
      'http://127.0.0.1:5000/routes',
      json,
    );
    
    final RoutesModel routes = RoutesModel.fromJson(result.data);
    
    routes.routes.sort(
      (v1, v2) => v2.id.compareTo(v1.id),
    );
    
    return routes;
  }
}
