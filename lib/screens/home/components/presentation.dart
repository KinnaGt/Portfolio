
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../components/on_hover_button.dart';
import '../../../components/on_hover_letter.dart';
import '../../../constants/constants.dart';
import '../../../particles/particle_canvas.dart';

class Presentation extends StatelessWidget {
  const Presentation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      
        children: [
           
          SizedBox(
            height: size.height-150,
            width: size.width,
          ),
            FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTextWidgets(splitInChars("Hi"), textColor),
              getTextWidgets(splitInChars("I'm Iñaki,"),Colors.white),
              // Text("i",style: textstyle(Colors.white),), 
              // Text("I'm Iñaki,",style: textstyle(Colors.white)),
              Row(children: [
                getTextWidgets(splitInChars("Mobile "), textColor),
                getTextWidgets(splitInChars("Developer"),Colors.white)
              ],),
              
              SizedBox(height: 25,),
              _bottomTexts(),
              const SizedBox(height: 50,),
              OnHoverButton(),
            ],
          ),
          ),
          
          
        ],);
  }

  

   

  Widget _bottomTexts() {
    return Padding(
      padding: EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Text("< "),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 24,
              color: bodyTextColor
            ),
            child: AnimatedTextKit(
              animatedTexts: [
              TypewriterAnimatedText('FullStack Mobile Developer',speed: const Duration(milliseconds: 50)),
              TypewriterAnimatedText('Design first, then code',speed: const Duration(milliseconds: 50)),
              TypewriterAnimatedText('Do not patch bugs out, rewrite them',speed: const Duration(milliseconds: 50)),
              TypewriterAnimatedText('Do not test bugs out, design them out',speed: const Duration(milliseconds: 50)),
            ],
            pause: Duration(seconds: 1),
            repeatForever: true,
          ),
        ),
        Text(" />")
    ],
  )
);
  }
}