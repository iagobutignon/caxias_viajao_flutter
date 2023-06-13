class RouteModel {
  final String id;
  final String label;
  final String targetId;
  final double x;
  final double y;

  RouteModel({
    required this.id,
    required this.label,
    required this.targetId,
    required this.x,
    required this.y,
  });

  factory RouteModel.fromString(String data) {
    final items = data.split(',');
    final aux = items.map((item) {
      final data = item.split(':');
      return data[1].replaceAll('"', '').replaceAll('}', '').replaceAll('{', '').trim();
    }).toList();

    return RouteModel(
      id: aux[0],
      label: aux[1],
      targetId: aux[2],
      x: double.parse(aux[3]),
      y: double.parse(aux[4]),
    );
  }
}
