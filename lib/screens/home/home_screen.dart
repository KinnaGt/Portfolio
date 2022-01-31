import 'package:flutter/material.dart';
import 'package:myportfolio/components/wave.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/particles/particle_canvas.dart';
import 'package:myportfolio/screens/home/components/mouse_animation.dart';

import '../main/main_screen.dart';
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
            //ParticleCanvas(height: size.height, width: size.width),
            Padding(
              padding:EdgeInsets.only(left: 25),
              child : Column(
                children: [
                    SizedBox(height: size.height/5,),
                    Presentation(), 
                    
                ] 
              )
            ),
            // Positioned(
            //   child: Wave(),
            //   bottom: 0,
            // )
            //MouseAnimation()
        ],)
        // HighLightsInfo(),
        // MyProjects(),
        // Recommendations(),
      ],
    );
  }
}
