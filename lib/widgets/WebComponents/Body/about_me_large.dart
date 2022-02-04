import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/helpers/responsive_app.dart';
import 'package:portfolio/util/sizing_info.dart';
import 'package:portfolio/values/string_app.dart';
import 'package:portfolio/values/style.dart';

class AboutMeLarge extends StatelessWidget {
  const AboutMeLarge({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late ResponsiveApp responsiveApp;
    responsiveApp= ResponsiveApp(context);
    var size = MediaQuery.of(context).size;
    if (!isTablet(context)) {
      return Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF202020),
                Color(0xFF101010),
              ],),
              // image: DecorationImage(
              //   image: NetworkImage("assets/icons/fondocolorgris.jpg"),
              //   fit: BoxFit.cover,
              // ),  
            ),
          padding: const EdgeInsets.only(top:75),
          child: Stack(
          children: [
          
            Row(
              
              children:[
              const SizedBox(width: 100,),
              Column(
              children: [
                SizedBox(
                  height: 92,
                  child: DefaultTextStyle(style: TextStyle(color: Colors.white,fontFamily: 'Elastic',fontSize: responsiveApp.headline1,letterSpacing: 5,shadows: <Shadow>[
                  const Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color(0xFFFD2155),
                  )]),
                  child:AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('About Me ',),
                    ],

                )),

                ),
                  
              
                const SizedBox(height: 25,),
                _AboutMeContainerTextLarge(),
                ],),

              
              Expanded(
                child: Column(
                children: [
                  SizedBox(height: 30,),
                  TweenAnimationBuilder(tween: Tween<double>(begin: 0,end:1), duration: defaultDuration, builder:(context,double value, child) => 
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,//Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                    children: [
                      skillCircle(size.width/16,0.8,"Flutter",responsiveApp.headline6),
                      SizedBox(width: 20,),
                      skillCircle(size.width/16,0.5,"Firebase",responsiveApp.headline6),
                      SizedBox(width: 20,),
                      skillCircle(size.width/16,0.5,"SQL",responsiveApp.headline6),
                      SizedBox(width: 20,),
                    ],)
                  ),
                
                skillsBar(),
                SizedBox(height: 50,),
                
                
              ],),),
              const SizedBox(width: 100,),
              ]
              
            )]
            
        )) ,
        Positioned(
          bottom: 0,
          child: TextLiquidFill(
          text: '',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontSize: 2,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: size.height/20 ,
          boxWidth: size.width,
          loadDuration: const Duration(minutes: 60),
          waveDuration: const Duration(seconds: 2),
        ),)
        ]);
    } else {
      return Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("assets/icons/fondocolor.jpg"),
                fit: BoxFit.cover,
              ),  
            ),
          padding: EdgeInsets.only(top:75),
          child: Stack(
          children: [
          
            Column(
              
              children:[
              const SizedBox(width: 100,),
              Column(
              children: [
                SizedBox(
                  height: 76,
                  child: DefaultTextStyle(style: TextStyle(color: Colors.white,fontFamily: 'Elastic',fontSize: responsiveApp.headline1,letterSpacing: 5,shadows: <Shadow>[
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color(0xFFFD2155),
                  )]),
                  child:AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('About Me ',),
                    ],

                )),

                ),
                  
                const SizedBox(height: 25,),
                  _AboutMeContainerTextMedium(),
                ],),

                const SizedBox(height: 25,),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,//Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  SizedBox(width: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,//Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                    children: [
                      skillCircle(size.width/8,0.8,"Flutter",responsiveApp.headline7),
                      SizedBox(width: 20,),
                      skillCircle(size.width/8,0.5,"Firebase",responsiveApp.headline7),
                      SizedBox(width: 20,),
                      skillCircle(size.width/8,0.35,"Back-end",responsiveApp.headline7),
                      SizedBox(width: 20,),
                    ],),                  
                SizedBox(width:20),
                skillBarMedium(size),
                SizedBox(height: 150,),
                
                
              ],),
              ]
              
            )]
            
        )) ,
          Positioned(
          bottom: 0,
          child: TextLiquidFill(
          text: '',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontSize: 2,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: size.height/20 ,
          boxWidth: size.width,
          loadDuration: const Duration(minutes: 60),
          waveDuration: const Duration(seconds: 2),
        ),)
        ]);
    }
  }


Widget makeBarMedium(colorBar,progress,size){
    return Stack(
      children: [
        Container(
        height: 3,
        width: size.width-60,
        decoration: BoxDecoration(
          color:Colors.grey,
        ),
        ),
        Container(
        decoration: BoxDecoration(
          color:colorBar,
        ),
        height: 3,
        width: progress,
        )
      ],
    );
  }

  Widget makeBar(colorBar,progress){
    return Stack(
      children: [
        Container(
        height: 3,
        width: 400,
        decoration: BoxDecoration(
          color:Colors.grey,
        ),
        ),
        Container(
        decoration: BoxDecoration(
          color:colorBar,
        ),
        height: 3,
        width: progress,
        )
      ],
    );
  }

  Widget skillsBar(){
    return Column(
      children: [
          SizedBox(height: 50,),
          Text("Front-end",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5,),),
          SizedBox(height: 10,),
          makeBar(Colors.red,280),
          SizedBox(height: 40,),
              
          Text("Back-end",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 10,),
          makeBar(Colors.green,150),
          SizedBox(height: 40,),
          
          Text("Java",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 10,),
          makeBar(Colors.blue,210),
          SizedBox(height: 40,),
          
          Text("Kotlin",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 10,),
          makeBar(Colors.lightBlue,340),
          SizedBox(height: 40,),
          
          Text("Flutter",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 10,),
          makeBar(Colors.orange,250),
      ],);
  }

Widget skillBarMedium(size){
  return Column(
      children: [
          SizedBox(height: 20,),
          Text("Front-end",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5,),),
          SizedBox(height: 5,),
          makeBarMedium(Colors.red,280,size),
          SizedBox(height: 20,),
              
          Text("Back-end",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 5,),
          makeBarMedium(Colors.green,150,size),
          SizedBox(height: 20,),
          
          Text("Java",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 5,),
          makeBarMedium(Colors.blue,210,size),
          SizedBox(height: 20,),
          
          Text("Kotlin",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 5,),
          makeBarMedium(Colors.lightBlue,340,size),
          SizedBox(height: 20,),
          
          Text("Flutter",style: TextStyle(color: Colors.white,fontFamily: 'Moon',fontSize: 14,letterSpacing: 5),),
          SizedBox(height: 5,),
          makeBarMedium(Colors.orange,250,size),
          SizedBox(height: 100,child: Container())
      ],);
}


Widget skillCircle(double size,double percentDo,skillName,fontSize){
    return  CircularPercentIndicator(
          animation: true,
          animationDuration: 200,
          radius: size,
          lineWidth: 3.0,
          percent: percentDo,
          backgroundColor: Colors.black38,
          progressColor: yellow,
          center: Text((percentDo *100).toString()+"%",style:TextStyle(fontSize: fontSize+12) ,),
          footer: Padding(padding: EdgeInsets.only(top:10),child: Text(skillName,style: TextStyle(fontSize: fontSize+8 ),))
        );
  }
}



class _AboutMeContainerTextMedium extends StatelessWidget {
  const _AboutMeContainerTextMedium({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(15),
              child: DefaultTextStyle(style: const TextStyle(height: 1.5,color: Colors.white,fontFamily: 'Moon',fontSize: 18 ,letterSpacing: 3,shadows: <Shadow>[
              Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 3.0,
                color: Color(0xFFFD2155),
              )
            ]),
            child: AnimatedTextKit(
            animatedTexts: [TypewriterAnimatedText(aboutMeStrLarge ,
              speed: const Duration(milliseconds: 20),),],
            isRepeatingAnimation: false,
            )),
        );
  }
}

class _AboutMeContainerTextLarge extends StatelessWidget {
  _AboutMeContainerTextLarge({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(15),
              child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 600,
                maxWidth: 600,
                minHeight: 500,
                minWidth: 600,
              ),
              child: DefaultTextStyle(style: const TextStyle(height: 1.5,color: Colors.white,fontFamily: 'Moon',fontSize: 24 ,letterSpacing: 3,shadows: <Shadow>[
              Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 3.0,
                color: Color(0xFFFD2155),
              )
            ]),
            child: AnimatedTextKit(
            animatedTexts: [TypewriterAnimatedText(aboutMeStrLarge ,
              speed: const Duration(milliseconds: 20),),],
            isRepeatingAnimation: false,
            )),
          ),
        );
        
  }
}