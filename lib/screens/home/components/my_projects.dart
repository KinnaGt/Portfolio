import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({ Key? key }) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        FittedBox(
        fit: BoxFit.fitWidth,
        child: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(child:getTextWidgets(splitInChars("My Projects"), textColor),top: 0,left: size.width/2,right: size.width/2,),
                
              ] 
            ),
            
            SizedBox(height: 100,),
            Row(
              children: [
                projectAlert(),
                const SizedBox(width: 100,),
                projectAlert(),
                const SizedBox(width: 100,),
                projectAlert(),
            ],) ,
            
            SizedBox(height: 50,),
            Row(
              children: [
                projectAlert(),
                const SizedBox(width: 100,),
                projectAlert(),
                const SizedBox(width: 100,),
                projectAlert(),
            ],)  
          ],
          ),)
        )],
  );
  }
}

Widget projectAlert() {
  return Container(
    height: 250,
    width: 250,
    decoration: BoxDecoration(
      border: Border.all(width: 2,color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(2500.0))
    )
  );
}