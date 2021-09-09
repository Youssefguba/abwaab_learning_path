import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class CurvePainter extends CustomPainter {
  bool active = false;
  bool? leftDirection = false;

  CurvePainter(this.leftDirection, this.active);

  late Rect rect;
  late RRect rrect;
  late Radius radius;

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    final paint = Paint();

    // Circular of Rect.
    radius = Radius.circular(50);
    // Color of Stroke
    paint.color = active ? Colors.orange : Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;


    if (leftDirection!) {
      rect = Rect.fromLTWH(x * 0.74, -49.0, x / 2.5, y / 0.9);
      rrect = RRect.fromRectAndRadius(rect, radius);
      canvas.clipRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(300, -42.0, x / 0.3, y * 2),
          radius,
        ),
      );
    } else {
      rect = Rect.fromLTWH(-x * 0.16, -45.0, x / 2.5, y / 0.99);
      rrect = RRect.fromRectAndRadius(rect, radius);
      canvas.clipRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(-100, -40, x / 2.5, y * 2),
          radius,
        ),
      );
    }

    // Draw RRect.
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CurvePainter oldDelegate) => false;
}
