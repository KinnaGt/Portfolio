import 'package:flutter/material.dart';

import '../../../components/custom_form.dart';
import '../../../constants/constants.dart';
import '../../../responsive.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({ Key? key }) : super(key: key);

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    return Stack(
      alignment: Alignment.topLeft,
      children:[ 

        FittedBox(
          
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: getTextWidgets(splitInChars("Contact Me ! "), textColor)
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 320,
                                height: 75,
                                child: TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                                  ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                  }
                                )
                              ),
                              SizedBox(width: 20,),
                              SizedBox(
                                width: 320,
                                height: 75,
                                child: TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                  hintText: 'Subject',
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                                  ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                  }
                                )
                              )
                          ],
                        ),
                        SizedBox(
                          width: 660,
                          height: 320,
                          child: TextFormField(
                            maxLines: 15,
                            decoration: InputDecoration(
                            hintText: 'Subject',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 2.0),
                            ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill in all required fields';
                              }
                            }
                          ) 
                        ),
                        SizedBox(height: 100,)
                        ]),
                    )
                ],
              ),
              SizedBox(
                width: size.width/2-50,
                child:Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                  height: Responsive.isMobileLarge(context)? 320/2 : 320,
                  width: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      color: Colors.white),
                ),

                

                ],
              ),
              ),
              


             

            ],
          )
        ),
        
        
      ]
    );
  }
}