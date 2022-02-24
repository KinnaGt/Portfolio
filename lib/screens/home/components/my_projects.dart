import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/strings.dart';
import '../../../responsive.dart';
import 'carousel.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    Responsive.isTablet(context) ? 750 : 850,
                                maxHeight:
                                    Responsive.isTablet(context) ? 350 : 350,
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
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
                                        left: Responsive.isTablet(context)
                                            ? 10
                                            : 20),
                                    child: Text(myProjectsStr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            wordSpacing: 5,
                                            height: 1.5,
                                            fontSize:
                                                Responsive.isTablet(context)
                                                    ? 12
                                                    : 24,
                                            shadows: _getShadows())),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 400,
                              padding: const EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fabrizio Torrico",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  const Text("Linkedin"),
                                  const SizedBox(height: defaultPadding),
                                  Text(
                                    recommendationFabri,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 25),
                            Container(
                              width: 400,
                              padding: const EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Josue Suarez ",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  const Text("Linkedin"),
                                  const SizedBox(height: defaultPadding),
                                  Text(
                                    recommendationJosu,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    const CardSlider()
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
