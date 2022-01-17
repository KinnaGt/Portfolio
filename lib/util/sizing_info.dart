import 'package:flutter/material.dart';

// MEDIA QUERY = AYUDA PARA SACAR EL ANCHO Y ALTO DE LA PANTALLA 

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < tabletSmall;
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= tabletSmall &&
      MediaQuery.of(context).size.width <= 1160;
}

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width > desktopSmall;
}

bool isMobileAndTablet(context) {
  return MediaQuery.of(context).size.width <= tabletExtraLarge;
  }

 bool isCustomScreen(BuildContext context) =>
  MediaQuery.of(context).size.width >= mediumScreenSize &&
  MediaQuery.of(context).size.width <= customScreenSize;
  

//Mobile size
double get mobileSmall => 320;

double get mobileNormal => 375;

double get mobileLarge => 414;

double get mobileExtraLarge => 480;

//table size
double get tabletSmall => 600;

double get tabletNormal => 768;

double get tabletLarge => 850;

double get tabletExtraLarge => 900;

//desktop size

const int mediumScreenSize = 768;

double get desktopSmall => 950;


const int customScreenSize = 1100;

double get desktopNormal => 1920;

double get desktopLarge => 3840;

double get desktopExtraLarge => 4096;