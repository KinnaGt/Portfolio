import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';

class ProjectContainer extends StatefulWidget {
  const ProjectContainer({Key? key, required this.height, required this.width}) : super(key: key);

  final double height;//Alto 
  final double width; //ancho
  @override
  _ProjectContainerState createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  List<Offset> dots = []; //matriz de puntos 
  List<List> lines = [];  // lineas dibujadas entre puntos
  late AnimationController controller, mouseController;
  Duration mouseDuration = const Duration(milliseconds: 600);
  var random = Random();
  List<bool> rndDirection = [];//matrices de direcciones
  List<double> rndPos = [];    //matrices de direcciones
  late double speed = 0.5, temp = 0, dx, dy, mradius = 0;//Velocidad,posiciones,radio de mouse
  int totalDots = 10; // cantidad de puntos

  @override
  void dispose() {
    controller.dispose();
    mouseController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    addDots();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          speed = speed;
          for (var i = 0; i < dots.length; i++) {
            if (rndDirection[i]) {
              temp = -speed;
            } else {
              temp = speed;
            }
            dx = dots[i].dx + (temp * rndPos[i]);
            dy = dots[i].dy + rndPos[i] * speed;
            if (dx > widget.width) {
              dx = dx - widget.width;
            } else if (dx < 0) {
              dx = dx + widget.width;
            }
            if (dy > widget.height) {
              dy = dy - widget.height;
            } else if (dy < 0) {
              dy = dy + widget.height;
            }
            dots[i] = Offset(dx, dy);
          }
          drawlines();
        });
      });
    controller.repeat();
    changeDirection();
    super.initState();
  }

  addDots() {
    for (var i = 0; i < totalDots; i++) {
      dots.add(Offset(random.nextDouble() * widget.width,
          random.nextDouble() * widget.height));
      rndPos.add(random.nextDouble());
      rndDirection.add(random.nextBool());
    }
  }

  drawlines() {
    lines = [];
    var distanceToDrawLine = 0.0;
    for (var i = 0; i < dots.length; i++) {
      for (var j = 0; j < dots.length; j++) {
        distanceToDrawLine = sqrt(aMinusBSquare(dots[j].dx, dots[i].dx) +
            aMinusBSquare(dots[j].dy, dots[i].dy));
        if (distanceToDrawLine < 50) {
          lines.add([dots[i], dots[j], distanceToDrawLine]);
        }
      }
    }
  }

  aMinusBSquare(a, b) {
    return pow((a - b), 2);
  }


  void changeDirection() async {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      for (var i = 0; i < totalDots; i++) {
        rndDirection[i] = random.nextBool();
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: dy,
            left:dx,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(width: 2,color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(2500.0))
              )
            ),
            


          ),
          CustomPaint(
          painter: DotsPainter(dots: dots, lines: lines),
          ),
        ],)
      ),
    );
  }
}

class DotsPainter extends CustomPainter {
  DotsPainter({required this.lines, required this.dots});

  final List<Offset> dots;
  final List<List> lines;
  List<double> sizes = [100];
  var random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < dots.length; i++) {
      canvas.drawCircle(
          dots[i], sizes[0], Paint()..color = Colors.white.withOpacity(0.5));
    }
    for (var element in lines) {
      var paint = Paint()
        ..color = Colors.white54..strokeWidth = 2 * (1 - element[2] / 50) as double;
      canvas.drawLine(element[0], element[1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
