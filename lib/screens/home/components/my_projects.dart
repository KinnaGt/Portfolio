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
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Positioned(child:getTextWidgets(splitInChars("My Projects"), textColor),top: 0,left: size.width/2,right: size.width/2,),
                  
                ] 
              ),
              const SizedBox(height: 100,),
              // Row(
              //   children: [
              //     _projectAlert(),
              //     const SizedBox(width: 100,),
              //     _projectAlert(),
              //     const SizedBox(width: 100,),
              //     _projectAlert(),
              // ],) ,
              
              // const SizedBox(height: 50,),
              // Row(
              //   children: [
              //     _projectAlert(),
              //     const SizedBox(width: 100,),
              //     _projectAlert(),
              //     const SizedBox(width: 100,),
              //     _projectAlert(),
              // ],), 
              // const SizedBox(height: 100,), 
            
            ],
            
            ),
          ),),
        
    ],);
  }
}

Widget _projectAlert() {
  return Container(
    height: 250,
    width: 250,
    decoration: BoxDecoration(
      border: Border.all(width: 2,color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(2500.0))
    )
  );
}