import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/util/sizing_info.dart';
import 'package:portfolio/values/string_app.dart';
import 'package:portfolio/widgets/MobileComponents/image_small.dart';
import 'package:portfolio/widgets/WebComponents/Body/image_large.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ali Azimoshan',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  var selectedSlide;

  imageBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height ,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/fondo.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List allSlides = [
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false}
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeSelector);
    setState(() {
      selectedSlide = allSlides[0];
      selectedSlide['selected'] = true;
    });
  }

  changeSelector() {
    var maxScrollVal = _scrollController.position.maxScrollExtent;

    var divisor = (maxScrollVal / allSlides.length) + 20;

    var scrollValue = _scrollController.offset.round();
    var slideValue = (scrollValue / divisor).round();

    var currentSlide = allSlides.indexWhere((slide) => slide['selected']);

    setState(() {
      allSlides[currentSlide]['selected'] = false;
      selectedSlide = allSlides[slideValue];
      selectedSlide['selected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              controller: _scrollController,
              children: allSlides.map((element) {
                log(element.toString());
                return getCards(element);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget getCards(slide) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: AnimatedCrossFade(
        firstChild:isMobile(context)
            ? ImageSmall()
            : ImageLarge(),
        duration: Duration(seconds: 1),
        secondChild: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
        ),
        crossFadeState: slide['selected']
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}