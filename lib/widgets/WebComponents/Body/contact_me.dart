// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:portfolio/helpers/responsive_app.dart';
// import 'package:portfolio/values/string_app.dart';
// import 'package:portfolio/values/style.dart';
// import 'package:portfolio/widgets/Components/google_map.dart';

// class ContactMeLarge extends StatelessWidget {
//   const ContactMeLarge({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     late ResponsiveApp responsiveApp;
//     responsiveApp= ResponsiveApp(context);
//     var size = MediaQuery.of(context).size;
//     return Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage("assets/icons/fondocolor.jpg"),
//                 fit: BoxFit.cover,
//               ),  
//             ),
//           padding: const EdgeInsets.only(top:75,right: 25),
//           child: Stack(
//           children: [
//             Row(
//               children:[
                
//               SizedBox(width: size.width/12,),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
                
//                 SizedBox(
//                   height: 92,
//                   child: DefaultTextStyle(style: TextStyle(color: Colors.white,fontFamily: 'Elastic',fontSize: responsiveApp.headline1,letterSpacing: 5,shadows: <Shadow>[
//                   const Shadow(
//                     offset: Offset(10.0, 10.0),
//                     blurRadius: 3.0,
//                     color: Color(0xFFFD2155),
//                   )]),
//                   child:AnimatedTextKit(
//                     isRepeatingAnimation: false,
//                     animatedTexts: [
//                       TyperAnimatedText('Contact Me',),
//                     ],
//                   )),
//                 ),
//                 SizedBox(height: 25,),
//                 //CONTAINER CON EL TEXTO 
//                 Container(
//                   padding: const EdgeInsets.only(top:15,right: 15,bottom: 15),
//                   child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     maxHeight: 200,
//                     maxWidth: 800,
//                     minHeight: 200,
//                     minWidth: 800,
//                   ),
//                   child: DefaultTextStyle(style:  TextStyle(height: 1.5,color: Colors.white,fontFamily: 'Moon',fontSize: responsiveApp.bodyText1 ,letterSpacing: 3,shadows: <Shadow>[
//                   Shadow(
//                     offset: Offset(10.0, 10.0),
//                     blurRadius: 3.0,
//                     color: Color(0xFFFD2155),
//                   )
//                   ]),
//                   child: AnimatedTextKit(
//                   animatedTexts: [TypewriterAnimatedText(contactTextStr ,
//                     speed: const Duration(milliseconds: 20),),],
//                     isRepeatingAnimation: false,
//                   )),
//                   ),
                  
//                 ),

//               //FORMS
//               Row(
//                 children: [
//                   SizedBox(
//                   width: responsiveApp.widthForm*2,
//                   height: 50,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                     hintText: 'Name',
//                     hintStyle: TextStyle(color: Colors.white),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: borderColor, width: 2.0),
//                     ),
//                     ),
//                     validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please fill in all required fields';
//                     }
//                   },
//                   )),


//                   SizedBox(width: 25,),

                 
//                   SizedBox(
//                   width: responsiveApp.widthForm*2,
//                   height: 50,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                     hintText: 'Email',
//                     hintStyle: TextStyle(color: Colors.white),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: borderColor, width: 2.0),
//                     ),
//                     ),
//                     validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please fill in all required fields';
//                     }
//                 }
//                 )),
//               ],),
            
//               SizedBox(height: 25,),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: responsiveApp.widthForm*4+25,
//                     height: 50,
//                     child: TextFormField(
//                       maxLines: 15,
//                       decoration: InputDecoration(
//                       hintText: 'Subject',
//                       hintStyle: TextStyle(color: Colors.white),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: borderColor, width: 2.0),
//                       ),
//                       ),
//                       validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please fill in all required fields';
//                       }
//                   }
//                   )),
//                 ],
//               ),
//               SizedBox(height: 25,),
//               Row(
//                 children: [
//                   SizedBox(
//                   width: responsiveApp.widthForm*4+25,
//                   height: 250,
//                   child: TextFormField(
//                     maxLines: 15,
//                     decoration: InputDecoration(
//                     hintText: 'Message',
//                     hintStyle: TextStyle(color: Colors.white),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: borderColor, width: 2.0),
//                     ),
//                     ),
//                     validator: (String? value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please fill in all required fields';
//                     }
//                 }
//                 ))
//                 ],
//               )
//               ]),),
//               //
//               Expanded(child: Container()),//2da Fila
              
             
//               ]),
              
//           ])
//           )
//         ]);
//   }
// }