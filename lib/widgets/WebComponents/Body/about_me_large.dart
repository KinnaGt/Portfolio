import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/values/string_app.dart';

class AboutMeLarge extends StatelessWidget {
  const AboutMeLarge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Stack(

      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("assets/icons/degrade_about.jpg"),
              fit: BoxFit.cover,
            ),  
          ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top:75),
        child: Column(
        children: [
          Center(
              child: DefaultTextStyle(style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 64,letterSpacing: 5,shadows: <Shadow>[
              const Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ]),
            child: AnimatedTextKit(
            animatedTexts: [WavyAnimatedText('About Me !'),],
            isRepeatingAnimation: false,
            ))
          ),
          SizedBox(height: 50,),

          Row(

            children:[
            SizedBox(width: 100,),
            AboutMeContainerText(),
            ] 

          )
          ]
      
      ))]);
  }

}


class AboutMeContainerText extends StatelessWidget {
  const AboutMeContainerText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25)
              ),
              child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 600,
                maxWidth: 600,
                minHeight: 300,
                minWidth: 300,
              ),
              child: DefaultTextStyle(style: const TextStyle(height: 1.5,color: Colors.white,fontFamily: 'Moon',fontSize: 24,letterSpacing: 3,shadows: <Shadow>[
              Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ]),
            child: AnimatedTextKit(
            animatedTexts: [TypewriterAnimatedText(aboutMeStrLarge ,
              speed: const Duration(milliseconds: 50),),],
            isRepeatingAnimation: false,
            )),
          ),
        );
  }
}