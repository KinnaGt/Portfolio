
import 'package:flutter/material.dart';
import 'package:portfolio/particles/particle_canvas.dart';
import 'package:portfolio/widgets/MobileComponents/presentation_screen_small.dart';

class ImageSmall extends StatelessWidget {
  const ImageSmall({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("assets/icons/fondocelu.jpg"),
              fit: BoxFit.cover,
            ),  
          ),

      child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Center(
              child: ParticleCanvas(height: size.height, width: size.width),
            ),
            centerCard(),
            PresentationScreenSmall()
          ],
        ) ,
    );
            
           
  } 
  centerCard() {
      return Center();
  }  
}