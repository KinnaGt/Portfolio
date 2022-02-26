import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List images = [
  {'image': "assets/proyects/movieapp.png", 'title': "Movie App"},
  {'image': "assets/proyects/recipeapp.png", 'title': "Recipe App"},
  {'image': "assets/proyects/welcome.jpeg", 'title': "IntelliCards"},
  {'image': "assets/proyects/pokedex.png", 'title': "Pokedex"},
  {'image': "assets/proyects/pomodoro.png", 'title': "Pomodoro Timer"},
];


class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = images
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Stack(
                  children: <Widget>[
                    Image(width: 1200,fit: BoxFit.cover,image: AssetImage(item['image'])),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          item['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )
        .toList();

    // return SizedBox(
    //   height: 150,
    //   child: ListView(scrollDirection: Axis.horizontal, children: images),
    // );
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
      ),
      items: imageSliders,
    );
  }
}
