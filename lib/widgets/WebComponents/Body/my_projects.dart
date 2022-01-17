import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_app.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    late ResponsiveApp responsiveApp;
    responsiveApp= ResponsiveApp(context);
    const colorizeColors = [
      Colors.white,
      Colors.white12,
      Colors.white24,
      Colors.white30,
      Colors.white24,
      Colors.white12,
      Colors.white,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 72,
      fontFamily: 'Elastic'
    );
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          
          padding: EdgeInsets.only(top:75),
          alignment: Alignment.topLeft,
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("assets/icons/fondo.jpg"),
              fit: BoxFit.cover,
            ),  
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:75) ,
          child: Center(
            child: AnimatedTextKit(
            animatedTexts: [
          ColorizeAnimatedText(
          'My Projects',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
          textAlign: TextAlign.center
          ),
        ],
        isRepeatingAnimation: true,
        
        ),
        )) ,
        ],);
  }
}