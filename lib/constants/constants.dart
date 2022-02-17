import 'dart:math';

import 'package:flutter/material.dart';

import '../components/on_hover_letter.dart';

const primaryColor = Color(0xFF08FDD8);
// const secondaryColor = Color(0xFF242430);
const textColor = Color(0xFF08FDD8);

const darkColor = Color(0xFF02446E);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF181818);
const backColor = Color(0xFF1D1D1D);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1); // we use it on our animation
const maxWidth = 1600.0; // max width of our web

Color randomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
} // Generate a random color.

List<String> splitInChars(String text) {
  List<String> list = [];
  for (int i = 0; i < text.length; i++) {
    list.add(text[i]);
  }
  return list;
}

TextStyle textstyle(Color color) {
  return TextStyle(
      color: color,
      fontFamily: 'Cripy',
      fontSize: 82,
      letterSpacing: 5,
      shadows: const <Shadow>[
        Shadow(
            offset: Offset(4, 4),
            blurRadius: 0.5,
            color: Color.fromARGB(255, 0, 0, 0))
      ]);
}

Widget getTextWidgets(List<String> strings, Color color) {
  return Row(
      children: strings
          .map((item) => OnHoverLetter(text: item, color: color))
          .toList());
}
