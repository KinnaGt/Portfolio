import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/constants/strings.dart';
import 'dart:math' as math;
import '../../../components/bird_animation.dart';
import '../../../windmill/windmill.dart';
import '../../../responsive.dart';
class AboutMe extends StatefulWidget {
  const AboutMe({ Key? key }) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe>  with TickerProviderStateMixin{
  late AnimationController windmillController;
  late Animation<double> windmillAnimation;



  @override
  void initState(){
    super.initState();
    // Animation setup for WindMill

    windmillController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
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
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children:[ 
        const BirdAnimation(start: -100,end: 1200,position: 120,),

        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
              SizedBox(
                width: size.width/2-50,
                child:Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                  height: Responsive.isMobileLarge(context)? 320/2 : 320,
                  width: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Responsive.isMobileLarge(context) ? 265/2 : 265),
                  child: WindmillBuilder(animation: windmillAnimation),
                ),

                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Image.asset('assets/images/flower.png'),
                ),
                Positioned(
                  right: 30,
                  bottom: 75,
                  child: Image.asset('assets/images/flower.png'),
                ),
                Responsive.isTablet(context) ? const SizedBox(): Positioned(
                  bottom: 100,
                  left: 175,
                  child: Image.asset('assets/images/flower.png'),
                ),
                Responsive.isTablet(context) ? const SizedBox(): Positioned(
                  bottom: 175,
                  right: 175,
                  child: Image.asset('assets/images/flower.png'),
                ),

                const Padding(
                  padding: EdgeInsets.only(top:100),
                  child: Divider(),
                )
                ],
              ),
              ),
              


              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: getTextWidgets(splitInChars("About Me ! "), textColor)
                  ),
                  const SizedBox(height: 20,),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 400,
                      maxWidth: 600,
                      minHeight: 400,
                      minWidth: 600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Text(aboutMeStrLarge,style: TextStyle(color: Colors.white,wordSpacing: 5,height: 1.5,fontSize: 24,shadows: _getShadows())),
                    )
                  ),
                ],
              ),

            ],
          )
        ),
        //SUN
          Positioned(
              top: 0,
              left: 25,
              child: Container(
                height: Responsive.isMobileLarge(context)? 20: 90,
                width: Responsive.isMobileLarge(context)? 20: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.white,
                          blurRadius: 10.0,
                          spreadRadius: 10.0),
                    ]),
              )),
        
      ]
    );
  }
  List<Shadow> _getShadows() {
    return <Shadow>[
            const Shadow(
              offset: Offset(2, 2),
              blurRadius: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ];
  }
}



  
