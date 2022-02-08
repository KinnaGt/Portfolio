import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OnHoverLetter extends StatefulWidget {
  final String text; 
  final Color color;
  const OnHoverLetter({ Key? key,required this.text, required this.color,}) : super(key: key);

  @override
  _OnHoverLetterState createState() => _OnHoverLetterState();
}

class _OnHoverLetterState extends State<OnHoverLetter> {
  bool isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(0.9,0.9)..translate(0,-8,3);
    final transform = isHovered?  hoveredTransform : Matrix4.identity();
     

    return MouseRegion(
      child: AnimatedContainer(
        child: Text(widget.text ,style: textStyle(isHovered ? randomColor() : widget.color),),
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

  TextStyle textStyle(Color color){
    return TextStyle(
        color: color,fontFamily: 'Cripy',fontSize: 82,letterSpacing: 5,shadows:const <Shadow>[
            Shadow(
              offset: Offset(4, 4),
              blurRadius: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ]
    );
  }
}

