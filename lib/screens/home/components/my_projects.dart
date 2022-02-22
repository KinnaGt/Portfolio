import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/project_container.dart';
import '../../../constants/constants.dart';
import '../../../constants/strings.dart';
import '../../../responsive.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  Timer? timer;
  List<double> position = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Stack(alignment: Alignment.topRight, children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          constraints: BoxConstraints(
                            maxWidth: Responsive.isTablet(context) ? 325 : 650,
                            maxHeight: Responsive.isTablet(context) ? 200 : 350,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Responsive.isTablet(context)
                                            ? 10
                                            : 20),
                                    child: getTextWidgets(
                                        splitInChars("My Projects!"),
                                        textColor)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        Responsive.isTablet(context) ? 10 : 20),
                                child: Text(myProjectsStr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        wordSpacing: 5,
                                        height: 1.5,
                                        fontSize: Responsive.isTablet(context)
                                            ? 12
                                            : 24,
                                        shadows: _getShadows())),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 400,
                    )
                  ],
                ),
              ]),
            ))
      ],
    );
  }

  List<Shadow> _getShadows() {
    return <Shadow>[
      const Shadow(
          offset: Offset(2, 2),
          blurRadius: 0.5,
          color: Color.fromARGB(255, 0, 0, 0))
    ];
  }
}
