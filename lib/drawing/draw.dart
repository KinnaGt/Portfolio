import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/drawing/drawn_line.dart';
import 'package:myportfolio/drawing/sketcher.dart';

var rng = Random();

class MouseDrawer extends StatefulWidget {
  const MouseDrawer({Key? key}) : super(key: key);

  @override
  MouseDrawerState createState() => MouseDrawerState();
}

class MouseDrawerState extends State<MouseDrawer> {
  double random = rng.nextInt(5).toDouble();
  DrawnLine line =
      DrawnLine(List<Offset>.of({}), primaryColor, rng.nextInt(5).toDouble());

  StreamController<List<DrawnLine>> linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  @override
  Widget build(BuildContext context) {
    return buildCurrentPath(context);
  }

  GestureDetector buildCurrentPath(BuildContext context) {
    random = rng.nextInt(5).toDouble();
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<DrawnLine>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: Sketcher(
                  width: random,
                  lines: [line],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    setState(() {
      line = DrawnLine([point], primaryColor, random);
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    final List<Offset> path = List.from(line.path)..add(point);
    setState(() {
      line = DrawnLine(path, primaryColor, random);
    });
  }

  void onPanEnd(DragEndDetails details) {
    setState(() {});
  }
}
