import 'package:flutter/material.dart';

import 'package:myportfolio/constants/constants.dart';

import '../responsive.dart';



class WindmillBuilder extends StatelessWidget {
  const WindmillBuilder({
    Key? key,
    required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: SizedBox(
          height: 250,
          width: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 40,
                  width: Responsive.isMobileLarge(context) ? 250/2 : 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: Responsive.isMobileLarge(context) ? 250/2 : 250,
                  width: 40,
                  child: const CircleAvatar(
                    backgroundColor: bgColor,

                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        });
  }
}

