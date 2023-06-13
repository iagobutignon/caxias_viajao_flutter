import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../services/interfaces/iroute_service.dart';
import '../states/home_state.dart';

class HomeStore extends Store<HomeState> {
  late final TextEditingController nameController;
  late final TextEditingController dataController;
  final IRouteService _routeService;
  
  HomeStore(this._routeService) : super(HomeState());

  @override
  void initStore() {
    nameController = TextEditingController();
    dataController = TextEditingController();
    super.initStore();
  }

  Future<void> onChangeUseCache(bool value) async {
    final aux = state;
    aux.useCache = value;
    await execute(() async => aux);
  }

  Future<void> getRoutes() async {
    try {
      setLoading(true, force: true);
      final name = nameController.text;
      final data = dataController.text;
      final useCache = state.useCache;

      final routes = await _routeService.getRoutes(name, data, useCache);

      final aux = state;
      aux.routes = routes;
      setLoading(false, force: true);
      await execute(() async => aux);
    } catch (e) {
      setLoading(false, force: true);
      setError(e);
    }
  }

  @override
  Future destroy() {
    nameController.dispose();
    dataController.dispose();
    return super.destroy();
  }
}