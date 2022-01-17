import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_app.dart';
import 'package:portfolio/values/string_app.dart';
import 'package:portfolio/values/style.dart';

import 'bottom_column.dart';
import 'info_text.dart';

class Footer extends StatelessWidget {
  late ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Container(
      padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
      color: dark,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  TextButton(onPressed: () => {}, child: Text("Github"),),
                  TextButton(onPressed: ()=>{}, child: Text("Instagram"),),
                  TextButton(onPressed: ()=>{}, child: Text("Email : ${emailDefaultStr}"),)
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          Padding(
              padding: responsiveApp.edgeInsetsApp.vrtSmallEdgeInsets,
              child: Divider(
                color: Theme.of(context).accentColor,
                height: responsiveApp.dividerHznHeight,
              )),
          Text(
            copyrightStr,
            style: Theme.of(context).accentTextTheme.bodyText1,
          ),
        ],
      ),
    );
  }

}