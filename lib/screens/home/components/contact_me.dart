import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myportfolio/components/send_email.dart';
import 'package:http/http.dart' as http;
import '../../../constants/constants.dart';
import '../../../responsive.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController emailSubject = TextEditingController();
  TextEditingController emailBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.topLeft, children: [
      FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: getTextWidgets(
                          splitInChars("Contact Me ! "), textColor)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 320,
                              height: 75,
                              child: TextFormField(
                                  controller: userEmail,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: primaryColor, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                    return null;
                                  })),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                              width: 320,
                              height: 75,
                              child: TextFormField(
                                  controller: emailSubject,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: 'Subject',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: primaryColor, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill in all required fields';
                                    }
                                    return null;
                                  }))
                        ],
                      ),
                      SizedBox(
                          width: 660,
                          height: 320,
                          child: TextFormField(
                              controller: emailBody,
                              maxLines: 15,
                              decoration: const InputDecoration(
                                hintText: 'Body',
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: primaryColor, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill in all required fields';
                                }
                                return null;
                              })),
                        Padding(
                        padding: EdgeInsets.only(bottom: 25, top: 25),
                        child: SendEmail(),
                        
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ]),
                  )
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Responsive.isMobile(context)
                  ? Container()
                  : SizedBox(
                      width: size.width / 2 - 50,
                      child: const Image(
                        image: AssetImage("assets/images/contact_me.png"),
                        fit: BoxFit.scaleDown,
                      )),
            ],
          )),
    ]);
    
  }
   Future _sendEmail(
      {required String email,
      required String subject,
      required String body}) async {
    const serviceId = 'service_ys0hnat';
    const templateId = 'template_p8copz9';
    const userId = 'd6r96LpnLZe0lBG2O';
    print("$email,$subject,$body");
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params' : {
            'user_email' : email,
            'user_subject' : subject,
            'user_message' : body
          }
        }));
    print(response.body);
  }
}
