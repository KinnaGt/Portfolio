import 'dart:math';

import 'package:flutter/material.dart';

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

Color randomColor(){
  final random = Random();
      return Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
}// Generate a random color.

List<String> splitInChars(String text){
  List<String> list = [];
  for (int i = 0; i < text.length;i++ ){
    list.add(text[i]);
  }
  return list;
}