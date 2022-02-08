
import 'package:flutter/material.dart';
import 'package:myportfolio/drawing/drawn_line.dart';

class Sketcher extends CustomPainter {
  final List<DrawnLine> lines;
  final double width;
  Sketcher({required this.width, required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; ++i) {
      // ignore: unnecessary_null_comparison
      if (lines[i] == null) continue;
      for (int j = 0; j < lines[i].path.length - 1; ++j) {
        paint.color = lines[i].color;
        paint.strokeWidth = lines[i].width;
        canvas.drawCircle(lines[i].path[j], width, paint);
      }
    }
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
