import 'package:flutter/material.dart';

import '../../../drawing/draw.dart';


class MouseAnimation extends StatefulWidget {
  const MouseAnimation({ Key? key }) : super(key: key);

  @override
  _MouseAnimationState createState() => _MouseAnimationState();
}

class _MouseAnimationState extends State<MouseAnimation> {
 
  @override
  Widget build(BuildContext context) {
    return const MouseDrawer();

  }
 
}
class DrawCircle extends CustomPainter {
  // ignore: unused_field
  late Paint _paint;

  DrawCircle() {
    _paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 1
    Paint paintMountains = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.brown;
    // 2
    Paint paintSun = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.deepOrangeAccent;

    // 3
    Path path = Path();
    path.moveTo(0, 250);
    path.lineTo(100, 200);
    path.lineTo(150, 150);
    path.lineTo(200, 50);
    path.lineTo(250, 150);
    path.lineTo(300, 200);
    path.lineTo(size.width, 250);
    path.lineTo(0, 250);
    canvas.drawPath(path, paintMountains);

    // 4
    path = Path();
    path.moveTo(100, 100);
    path.addOval(Rect.fromCircle(center: const Offset(100, 100), radius: 25));
    canvas.drawPath(path, paintSun);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

