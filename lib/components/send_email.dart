import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({ Key? key,}) : super(key: key);

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0,-8,0);
    final transform = isHovered?  hoveredTransform : Matrix4.identity();


    return MouseRegion(
      child: AnimatedContainer(
        child: OutlinedButton(
          onPressed: () => {}, 
          child: Text(isHovered ? "Click to send" : "Send Message!" ,style: TextStyle(color: isHovered ? Colors.white : primaryColor,fontSize: 24),),
          style:OutlinedButton.styleFrom(
            backgroundColor: isHovered ? darkColor : backColor,
            shape: const StadiumBorder(),
            side: BorderSide(color:isHovered ? Colors.white: primaryColor,width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16)
          ),
        ),


        duration: const Duration(milliseconds: 200),
        transform:transform ,
      ),
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
    );  
  }

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}

