import 'package:flutter/material.dart';
import 'package:myportfolio/components/project_container.dart';
import 'package:myportfolio/screens/home/components/contact_me.dart';
import '../../responsive.dart';
import '../main/main_screen.dart';
import 'components/about_me.dart';
import 'components/my_projects.dart';
import 'components/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
          AboutMe(),
          MyProjects(),
          ContactMe()
      ],
    );
  }
}
