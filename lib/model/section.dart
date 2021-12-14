import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/model/product.dart';
import 'package:portfolio/values/string_app.dart';

class Section{
  String title;
  String subtitle;
  Color color;
  List<Product> list;

  Section({required this.title,required this.subtitle,required this.color, required this.list});

}

List<Section>sections=[
  Section(
    title: coffeesStr,
    color: Colors.yellow,
    subtitle: "Cafe 100% puro",
    list: coffeesList,
  ),
  Section(
    title: drinksStr,
    color: Colors.red,
    subtitle: "Bebidas de todos los sabores",
    list: drinksList,
  ),
  Section(
    title: cakesStr,
    color: Colors.blue,
    subtitle: "Pasteles deliciosos",
    list: cakesList,
  ),
  Section(
    title: sandwichesStr,
    color: Colors.purpleAccent,
    subtitle: "Come algo ligero",
    list: sandwichesList,
  )
];