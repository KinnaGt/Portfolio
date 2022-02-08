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
    Size size = MediaQuery.of(context).size;
    return MainScreen(
      children: [
        Stack(
          children: [
            Positioned(
              right: 0,
              bottom: Responsive.isTablet(context) ? size.height/16 : -100,
                child: Image(
                  fit: BoxFit.contain,
                  height: Responsive.isTablet(context) ? size.height*0.7 : size.height,
                image: const AssetImage("assets/images/fondo.png",)
                )
              ),
            Padding(
              padding:EdgeInsets.only(left: Responsive.isMobile(context)? 5: 25),
              child : Column(
                children: [
                    SizedBox(height: size.height/5,),
                    const Presentation(), 
                ] 
              )
            ),
            //MouseAnimation()
        ],),
        const AboutMe(),
        Stack(
          alignment: Alignment.center,
          children: [
          const MyProjects(),
          ProjectContainer(height: size.height, width: size.width),
        ],),
        const ContactMe()
        // HighLightsInfo(),
        // Recommendations(),
      ],
    );
  }
}
