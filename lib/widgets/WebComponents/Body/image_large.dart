
import 'package:flutter/material.dart';
import 'package:portfolio/particles/particle_canvas.dart';
import 'package:portfolio/widgets/WebComponents/Body/presentation_screen.dart';

class ImageLarge extends StatelessWidget {
  const ImageLarge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("assets/icons/fondonuevito.jpg"),
              fit: BoxFit.fill,
            ),  
          ),

      child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Center(
              child: ParticleCanvas(height: size.height, width: size.width),
            ),
            centerCard(),
            PresentationScreen()
          ],
        ) ,
    );
  }

  centerCard() {
      return Center(
      );  
  }
}