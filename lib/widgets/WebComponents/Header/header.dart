import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_app.dart';
import 'package:portfolio/values/string_app.dart';

import 'header_button.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final double opacity;

  Header(this.opacity);

  @override
  _HeaderState createState() => _HeaderState();

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {

  late ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(widget.opacity),
      child: Padding(
        padding:responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              portfoliostr,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: responsiveApp.headline6,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: responsiveApp.letterSpacingHeaderWidth, // Espacio entre letras
              ),
            ),
            Expanded(child: Container()),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:responsiveApp.barSpace1Width),
                  HeaderButton(0,aboutUsStr),
                  SizedBox(width: responsiveApp.barSpace1Width/2),
                  HeaderButton(1,locationStr),
                  SizedBox(width: responsiveApp.barSpace1Width/2),
                ],
              ),
          ],
        ),
      ),
    );
  }

  bool isZero(opacity) =>  (opacity == 0);
}