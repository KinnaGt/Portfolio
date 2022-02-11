import 'package:flutter/material.dart';
import 'package:myportfolio/components/send_email.dart';

import '../../../constants/constants.dart';

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
                  SizedBox(height: 150,),
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
                                  decoration: const InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                      return null;
                                    
                                  }
                                )
                              ),
                              const SizedBox(width: 20,),
                              SizedBox(
                                width: 320,
                                height: 75,
                                child: TextFormField(
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                  hintText: 'Subject',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                                    
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                    return null;
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
                            decoration: const InputDecoration(
                            hintText: 'Body',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill in all required fields';
                              }
                              return null;
                            }
                          ) 
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 25,top: 25),
                          child: SendEmail(),
                        ),
                        SizedBox(height: 150,),
                        ]),
                    )
                ],
              ),
              const SizedBox(width: 100,),
              SizedBox(
                width: size.width/2-50,
                child: const Text("@",style: TextStyle(fontSize: 400),)
              ),
            ],
          )
        ),
        
        
      ]
    );
  }
}