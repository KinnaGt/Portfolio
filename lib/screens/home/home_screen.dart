import 'package:flutter/material.dart';
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
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 200),
            ),
            // ParticleCanvas(height: size.height, width: size.width),
            Positioned(
              right: 0,
              bottom: 200,
                child: Image(
                  fit: BoxFit.contain,
                  height: size.height*1.2,
                image: AssetImage("assets/images/fondo.png",)
                )
              ),
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
