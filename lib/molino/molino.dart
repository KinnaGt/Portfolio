import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:myportfolio/constants/constants.dart';

import '../responsive.dart';

class WindMill extends StatefulWidget {
  @override
  _WindMillState createState() => _WindMillState();
}

class _WindMillState extends State<WindMill> with TickerProviderStateMixin {
  late AnimationController birdAndCloudController;
  late AnimationController beeController;
  late AnimationController windmillController;

  late Animation<double> flyAnimation;
  late Animation<double> moveLeftToRightAnimation;
  late Animation<double> beeAnimation;
  late Animation<double> windmillAnimation;

  @override
  void initState() {
    super.initState();

    // Animation setup for WindMill

    windmillController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    windmillAnimation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(windmillController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              windmillController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              windmillController.forward();
            }
          });
    windmillController.forward();

    //  Animation Setup for beeAnimation
    beeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    beeAnimation = Tween<double>(begin: 0, end: 100)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(beeController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              beeController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              beeController.forward();
            }
          });
    beeController.forward();

// Cloud and Bird animation set up

    birdAndCloudController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    flyAnimation = Tween<double>(
      begin: 0,
      end: -100,
    )
        .chain(CurveTween(curve: Curves.easeInOutBack))
        .animate(birdAndCloudController);

    moveLeftToRightAnimation = Tween<double>(
      begin: 0,
      end: 350,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(birdAndCloudController);

    birdAndCloudController.repeat();
  }

  @override
  void dispose() {
    windmillController.dispose();
    birdAndCloudController.dispose();
    beeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 9,
                child: Container(
                  color: backColor,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: backColor,
                ),
              )
            ],
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: double.infinity,
          //     height: 150,
          //     child: BirdBuilder(
          //         control: birdAndCloudController,
          //         linear: moveLeftToRightAnimation,
          //         fly: flyAnimation),
          //   ),
          // ),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: 340,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      color: Colors.white),
                ),
              ),
              WindmillBuilder(animation: windmillAnimation),
              
            
            ],
          ),
          
          
          // Positioned(
          //   bottom: 50,
          //   child: Image.asset('assets/flower.png'),
          // ),
          // Positioned(
          //   bottom: 10,
          //   left: 100,
          //   child: Image.asset('assets/flower.png'),
          // ),
          // Positioned(
          //   bottom: 40,
          //   right: 20,
          //   child: Image.asset('assets/flower.png'),
          // ),
          // Positioned(
          //   bottom: 10,
          //   right: 100,
          //   child: Image.asset('assets/flower.png'),
          // ),
          // Positioned(
          //     bottom: 70, left: 60, child: Image.asset('assets/flower.png')),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: CloudBuilder(
          //       control: birdAndCloudController,
          //       leftToRight: moveLeftToRightAnimation),
          // ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: BeeBuilder(
          //       beeController: beeController, beeAnimation: beeAnimation),
          // )
        ],
      ),
    );
  }
}

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
        child: Container(
          height: 250,
          width: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 250,
                  width: 40,
                  child: CircleAvatar(
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

class CloudBuilder extends StatelessWidget {
  const CloudBuilder({
    Key? key,
    required this.control,
    required this.leftToRight,
  }) : super(key: key);

  final AnimationController control;
  final Animation<double> leftToRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 100,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: control,
        builder: (_, child) => Stack(
          children: [
            Positioned(
              left: leftToRight.value,
              child: Transform.translate(
                  offset: Offset(leftToRight.value, 0),
                  child: Icon(
                    Icons.cloud,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class BeeBuilder extends StatelessWidget {
  const BeeBuilder({
    Key? key,
    required this.beeController,
    required this.beeAnimation,
  }) : super(key: key);

  final AnimationController beeController;
  final Animation<double> beeAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 150,
      width: double.infinity,
      child: AnimatedBuilder(
          animation: beeController,
          builder: (_, child) => Stack(children: <Widget>[
                Positioned(
                  bottom: 100,
                  left: beeAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, beeAnimation.value),
                    child: Image.asset(
                      'assets/bee.png',
                      height: 30,
                    ),
                  ),
                ),
              ])),
    );
  }
}

class BirdBuilder extends StatelessWidget {
  const BirdBuilder({
    Key? key,
    required this.control,
    required this.linear,
    required this.fly,
  }) : super(key: key);

  final AnimationController control;
  final Animation<double> linear;
  final Animation<double> fly;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: control,
        builder: (_, child) => Stack(children: <Widget>[
              Positioned(
                top: 100,
                left: linear.value,
                child: Transform.translate(
                  offset: Offset(0, fly.value),
                  child: Image.asset(
                    'assets/bird.png',
                    height: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ]));
  }
}