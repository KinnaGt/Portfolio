import 'package:flutter/material.dart';
import 'package:portfolio/values/style.dart';
import 'helpers/responsive_app.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ResponsiveApp responsiveApp;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iñaki PortFolio",
      debugShowCheckedModeBanner: false,
      builder: (context,child){
        responsiveApp= ResponsiveApp(context);
        return Theme(data: ThemeData(
          backgroundColor: dark,
          primaryColor: lightdark,
          iconTheme: const IconThemeData(color: Colors.white),
          cardColor: Colors.white,
          primaryTextTheme: getTextTheme(),
          textTheme: getTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          indicatorColor: Colors.white,
          unselectedWidgetColor: Colors.blueGrey[300],
          fontFamily: 'Moon',
          tabBarTheme: TabBarTheme(
            labelColor:Colors.white,
            unselectedLabelColor: Colors.blueGrey[300],), 
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey),), 
          child: const HomePage());
      },
    );
  }

  getTextTheme(){
    return TextTheme(
      headline3: TextStyle(
        color: Colors.white,
          fontSize: responsiveApp.headline3
      ),
      headline6: TextStyle( // MAS CHICO
        color: Colors.white,
          fontSize: responsiveApp.headline6
      ),
      bodyText1: TextStyle( // MAS GRANDE
        color: Colors.black,
          fontSize: responsiveApp.bodyText1
      ),
      bodyText2: TextStyle(
        color: Colors.white,
          fontSize: responsiveApp.bodyText1
      ),
      headline2: TextStyle(
          color: Colors.white,
          fontSize: responsiveApp.headline2
      ),
    );
  }
}