import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../home/model/routes_model.dart';

class Painter extends CustomPainter {
  final RoutesModel? routes;
  final int zoom;

  Painter({
    required this.routes,
    this.zoom = 4,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    final lines = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = zoom * 0.4
      ..color = Colors.blue;

    final circles = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    if (routes == null) {
      return;
    }

    const icon = Icons.location_city;
    var builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontFamily: icon.fontFamily,
        fontSize: zoom * 7.5,
      ),
    )
      ..pushStyle(ui.TextStyle(
        color: Colors.black,
      ))
      ..addText(
        String.fromCharCode(icon.codePoint),
      );
    var para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 30));

    final len = routes!.routes.length;

    for (int i = 0; i < len; i++) {
      final from = routes!.routes[i];
      final to = routes!.routes.firstWhere((r) => r.id == from.targetId);
      canvas.drawLine(
        Offset(zoom * from.x, zoom * from.y),
        Offset(zoom * to.x, zoom * to.y),
        lines,
      );
    }

    // canvas.drawLine(
    //   Offset(zoom * routes!.routes[len - 1].x, zoom * routes!.routes[len - 1].y),
    //   Offset(zoom * routes!.routes[0].x, zoom * routes!.routes[0].y),
    //   lines,
    // );

    for (var route in routes!.routes) {
      canvas.drawParagraph(
        para,
        Offset(zoom * route.x, zoom * route.y),
      );

      canvas.drawCircle(
        Offset(zoom * route.x, zoom * route.y),
        zoom * 2,
        circles,
      );

      var textBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          fontSize: zoom * 3.5,
        ),
      )
        ..pushStyle(ui.TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ))
        ..addText(
          route.id,
        );
      var textPara = textBuilder.build();
      textPara.layout(const ui.ParagraphConstraints(width: 30));

      canvas.drawParagraph(
        textPara,
        Offset(zoom * route.x - zoom * 1.1, zoom * route.y - zoom * 2),
      );

      canvas.translate(0, size.height);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
