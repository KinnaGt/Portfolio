import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "",
      "",
      "",
      "",
      "",
    ];

    final List<Widget> images = [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 7, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/movieapp.png")),
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 7, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/recipeapp.png")),
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 7, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/welcome.jpeg")),
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 7, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/pokedex.png")),
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 7, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/pomodoro.png")),
      ),
    ];

    return Container(
      height: 150,
      child: ListView(scrollDirection: Axis.horizontal, children: images),
    );
    // return FittedBox(
    //   child: SizedBox(
    //     width: 500,
    //     height: 1000,
    //     child: VerticalCardPager(
    //       initialPage: 3,
    //       titles: titles,
    //       images: images,
    //       onPageChanged: (page) {},
    //       align: ALIGN.LEFT,
    //       onSelectedItem: (index) {},
    //     ),
    //   ),
    // );
  }
}
