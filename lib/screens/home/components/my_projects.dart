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
   
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75,),
              getTextWidgets(splitInChars("My Projects"), textColor),
              const SizedBox(height: 75,),
              Row(
                children: [
                  _projectAlert(),
                  const SizedBox(width: 75,),
                  _projectAlert(),
                  const SizedBox(width: 75,),
                  _projectAlert(),
              ],) ,
              
              const SizedBox(height: 50,),
              Row(
                children: [
                  _projectAlert(),
                  const SizedBox(width: 75,),
                  _projectAlert(),
                  const SizedBox(width: 75,),
                  _projectAlert(),
              ],), 
              const SizedBox(height: 150,), 
            ],
            
            ),
          ),),
        
    ],);
  }
}

Widget _projectAlert() {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      border: Border.all(width: 2,color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(2500.0))
    )
  );
}