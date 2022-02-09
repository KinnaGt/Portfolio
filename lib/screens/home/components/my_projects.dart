import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/project_container.dart';
import '../../../constants/constants.dart';
import '../../../constants/strings.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({ Key? key }) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {

  Timer? timer;
  List<double> position = [];
  @override
  Widget build(BuildContext context) {
   Size size= MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProjectContainer(height: size.height, width: size.width/2),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 350,
                      maxWidth: 600,
                      minHeight: 350,
                      minWidth: 600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:25),
                          child: getTextWidgets(splitInChars("About Me ! "), textColor)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:25),
                          child: Text(myProjectsStr,style: TextStyle(color: Colors.white,wordSpacing: 5,height: 1.5,fontSize: 24,shadows: _getShadows())),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 400,)
                ],
              ),
            ]),
        )
      )
    ],);
  }
  List<Shadow> _getShadows() {
    return <Shadow>[
            const Shadow(
              offset: Offset(2, 2),
              blurRadius: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ];
  }
}





