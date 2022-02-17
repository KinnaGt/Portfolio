import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../responsive.dart';

class OnHoverButton extends StatefulWidget {
  final ScrollController controller;
  const OnHoverButton({ Key? key,required this.controller}) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0,-8,0);
    final transform = isHovered?  hoveredTransform : Matrix4.identity();


    return MouseRegion(
      child: AnimatedContainer(
        child: OutlinedButton(
          onPressed: () => _scrollDown(widget.controller) ,
          child: Text(isHovered ? "Contact Me :D" : "Contact Me" ,style: TextStyle(color: isHovered ? Colors.white : primaryColor,fontSize: Responsive.isTablet(context) ? 8 : 18),),
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
  void _scrollDown(controller) {
  controller.animateTo(
    controller.position.maxScrollExtent,
    duration: const Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  );
}
}

