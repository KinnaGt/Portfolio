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
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      
      ),
      Container(
        color: Colors.yellow,
        
      ),
      Container(
        color: Colors.black,

      ),
      Container(
        color: Colors.cyan,
        
      ),
      Container(
        color: Colors.blue,
        
      ),
      Container(
        color: Colors.grey,
      ),
    ];

    return FittedBox(
      child: SizedBox(
      width: 350 ,
      height: 500,
      child: VerticalCardPager(
        textStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
