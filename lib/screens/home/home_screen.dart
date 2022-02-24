import 'package:flutter/material.dart';
import 'package:myportfolio/screens/home/components/contact_me.dart';
import '../main/main_screen.dart';
import 'components/about_me.dart';
import 'components/my_projects.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainScreen(
      children: [
          const AboutMe(),
          SizedBox(height: size.height / 8,),
          const MyProjects(),
          const ContactMe()
      ],
    );
  }
}
