import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../components/on_hover_button.dart';
import '../../../constants/constants.dart';
import '../../../particles/particle_canvas.dart';

class Presentation extends StatelessWidget {
  const Presentation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      
        children: [
          Container(height: size.height,width: size.width,),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi",style: textstyle(textColor),),
                // Text("i",style: textstyle(Colors.white),),
              Text("I'm Iñaki,",style: textstyle(Colors.white)),
              
              Row(children: [
                Text("Mobile ",style: textstyle(textColor)),
                FittedBox(
                  fit: BoxFit.fitWidth, 
                  child: Text("Developer.",style: textstyle(Colors.white),),
                ),
                
              ],),
              
              SizedBox(height: 25,),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("< FullStack Mobile Developer />",style: TextStyle(color:bodyTextColor,fontSize: 24),),
                ],)
              ),
             
               
              const SizedBox(height: 25,),

              OnHoverButton(),


              // InkWell(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       border: Border.all(color: primaryColor),
              //       borderRadius: BorderRadius.circular(5)
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.all(10),
              //       child: TextButton(
              //       onPressed: () => { print("Anda")},
              //       child: Text("Contact Me!",style: TextStyle(color:primaryColor),)),
              //     )
              //   )
              // ),
            ],
          ),
          ),
          
          
        ],);
  }

  TextStyle textstyle(Color color){
    return TextStyle(
        color: color,fontFamily: 'Cripy',fontSize: 82,letterSpacing: 5,shadows:const <Shadow>[
            Shadow(
              offset: Offset(5, 5),
              blurRadius: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ]
    );
  }
}