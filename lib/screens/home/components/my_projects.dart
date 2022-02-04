import 'package:flutter/material.dart';
import 'package:myportfolio/responsive.dart';

import '../../../constants/constants.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({ Key? key }) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
                height: size.height,
                width: size.width,
                ),
        Column(
          children: [
              FittedBox(
                fit: BoxFit.contain,
                child: getTextWidgets(splitInChars("My Projects !"), textColor),
              ),
              
              SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/images/arbol.png',
                  height: Responsive.isMobile(context) ? 25 :35,
                  color: Colors.white,
                ),
                ),
            ],
        )
      
      ],
    );
  }
}