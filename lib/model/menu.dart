

import 'package:portfolio/values/string_app.dart';

class Menu {
  final String title, image;

  Menu({ required this.title, required this.image});
}

List<Menu> menu = [
  Menu(
    title: coffeesStr,
    image: "assets/images/menu1.png",
  ),
  Menu(
    title: drinksStr,
    image: "assets/images/menu2.png",
  ),
  Menu(
    title: cakesStr,
    image: "assets/images/menu3.png",
  ),
  Menu(
    title: sandwichesStr,
    image: "assets/images/menu4.png",
  ),
];