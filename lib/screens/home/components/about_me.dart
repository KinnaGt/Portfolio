import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children:[
        Container(height: size.height,width: size.width,),
        Positioned(
          child: Text("About Me",style: textstyle(primaryColor),),
        ),
      ]
    );
  }
}