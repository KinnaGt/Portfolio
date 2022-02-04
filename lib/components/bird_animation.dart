import 'package:flutter/material.dart';

import '../responsive.dart';
class BirdAnimation extends StatefulWidget {
  final double start;
  final double end;
  final double position;
  BirdAnimation({ Key? key, required this.start, required this.end, required this.position,}) : super(key: key);

  @override
  _BirdAnimationState createState() => _BirdAnimationState();
}

class _BirdAnimationState extends State<BirdAnimation> with TickerProviderStateMixin {
  late AnimationController birdController;
  late Animation<double> flyAnimation;
  late Animation<double> moveLeftToRightAnimation;

  @override
  void initState() {
    super.initState();

     birdController = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    );

    flyAnimation = Tween<double>(
      begin: 0,
      end: -100,
    )
        .chain(CurveTween(curve: Curves.easeInOutBack))
        .animate(birdController);

    moveLeftToRightAnimation = Tween<double>(
      begin: widget.start,
      end: widget.end,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(birdController);

    birdController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 500,
              child: BirdBuilder(
                  control: birdController,
                  linear: moveLeftToRightAnimation,
                  fly: flyAnimation,
                  position: widget.position,
                  ),
            ),
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    birdController.dispose();
  }
}

class BirdBuilder extends StatelessWidget {
  const BirdBuilder({
    Key? key,
    required this.control,
    required this.linear,
    required this.fly,
    required this.position, 
  }) : super(key: key);
  final double position;
  final AnimationController control;
  final Animation<double> linear;
  final Animation<double> fly;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: control,
        builder: (_, child) => Stack(
          children: <Widget>[
              Positioned(
                top: position,
                left: linear.value,
                child: Transform.translate(
                  offset: Offset(0, fly.value),
                  child:RotationTransition(
                    turns:  const AlwaysStoppedAnimation(15 / 360),
                    child:  Image.asset(
                    'assets/images/bird.gif',
                    height: Responsive.isMobile(context) ? 25 :35,
                    color: Colors.white,
                  ),
                  ) 
                    ),
                ),

            ]));
  }
}