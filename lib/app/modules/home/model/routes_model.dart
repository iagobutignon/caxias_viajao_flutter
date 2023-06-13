import 'dart:convert';

import 'route_model.dart';

class RoutesModel {
  final double execTime;
  final double greatValue;
  final List<RouteModel> routes;

  RoutesModel({
    required this.execTime,
    required this.greatValue,
    required this.routes,
  });

  factory RoutesModel.fromJson(Map<String, dynamic> data) {
    final List r = data['routes'];

    final aux = r.map((e) {
      final j = json.encode(e);
      return j;
    }).toList();

    return RoutesModel(
      execTime: data['exec_time'],
      greatValue: data['great_value'],
      routes: aux.map((e) => RouteModel.fromString(e)).toList(),
    );
  }
}
