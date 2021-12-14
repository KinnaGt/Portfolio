import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/values/string_app.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double _width  = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack (
      children: [
        Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top:150),
        child: Column(
        children:  [
        
          // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
          DefaultTextStyle(style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 64,letterSpacing: 5,shadows: <Shadow>[
            const Shadow(
              offset: Offset(10.0, 10.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0)
            )
          ]),
          child: AnimatedTextKit(
          animatedTexts: [WavyAnimatedText('Hello !'),],
          isRepeatingAnimation: false,
          )),
          SizedBox(height: 64,),

          DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Moon',
              fontSize: 32,
              color:Colors.white,
              letterSpacing: 3,
              shadows: <Shadow>[
                Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
              ]),

            child: AnimatedTextKit(
            animatedTexts: [
              
              TypewriterAnimatedText(presentationStrMedium ,
              speed: const Duration(milliseconds: 50),),
            ],
            isRepeatingAnimation: false,
            )),
          
        ]) 
      ),
      Expanded(child: Container()),
      Container(
        padding: EdgeInsets.only(top: 500),
        alignment: Alignment.bottomCenter,
        child:IconButton(onPressed: ()=>{}, icon: const Icon(Icons.arrow_drop_down_circle_rounded,size: 32, )),
        
      )
      ],);
  }

  
}