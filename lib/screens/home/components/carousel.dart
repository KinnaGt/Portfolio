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
    ];

    final List<Widget> images = [
      Container(
        decoration:
            BoxDecoration(border: Border.all(width: 5, color: Colors.white),
            borderRadius:const  BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/movieapp.png")),
      ),
      Container(
        decoration:
            BoxDecoration(border: Border.all(width: 5, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/recipeapp.png")),
      ),
     Container(
        decoration:
            BoxDecoration(border: Border.all(width: 5, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/proyects/welcome.jpeg")),
      ),
    ];

    return FittedBox(
      child: SizedBox(
        width: 500,
        height: 800,
        child: VerticalCardPager(
          textStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          titles: titles,
          images: images,
          onPageChanged: (page) {},
          align: ALIGN.LEFT,
          onSelectedItem: (index) {},
        ),
      ),
    );
  }
}
