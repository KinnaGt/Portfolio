import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/constants/strings.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topLeft,
      children:[
        SizedBox(height: size.height,width: size.width,),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
              Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:25),
                    child: getTextWidgets(splitInChars("About Me ! "), textColor)
                  ),
                  SizedBox(height: 20,),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 600,
                      maxWidth: 600,
                      minHeight: 500,
                      minWidth: 600,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left:25),
                      child: Text(aboutMeStrLarge,style: TextStyle(color: Colors.white,wordSpacing: 5,height: 1.5,fontSize: 24,shadows: getShadows())),
                    )
                    
                  ),
                  

                ],
              )
            ],
          )
        )
      ]
    );
  }

  List<Shadow> getShadows() {
    return <Shadow>[
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)
            )
        ];
  }
}