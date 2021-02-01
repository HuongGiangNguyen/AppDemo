import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF03A9F4);
const Color accentColor = Color(0xFFFFD740);
const Color blackColor = Color(0xFF000000);
const Color attentionColor = Color(0xFFFF5A45);
const Color butterscotch = Color(0xFFffb23a);
const Color backgroundColor = Color(0xFFFAFAFA);
const Color secondaryColor = Color(0xFFD8D9D9);
const Color aquaMarineColor = Color(0xFF50e3c2);
const Color azureTwo = Color(0xFF29B6F6);
const Color cerulean = Color(0xFF0277BD);
const Color ceruleanTwo = Color(0xFF0288D1);
const Color peacockBlue = Color(0xFF01579b);
const Color paleBlue = Color(0xFFe1f5fe);
const Color powderBlue = Color(0xFFb3e5fc);
const Color azureThree = Color(0xFF039BE5);
const Color azureFour = Color(0xFF26b0f0);
const Color waterBlue = Color(0xFF1096dc);
const Color gunmetal = Color(0xFF585959);
const Color whiteTwo = Color(0xfffafafa);
final Color warmGrey = Color(0xFF9a9a9a);
final Color warmGreyTwo = Color(0xFF9e9e9e);
final Color slateGreyTwo = Color(0xFF6c6d6d);
final Color lightGreyBlueTwo = Color(0xFFb4b5b5);
final Color duckEggBlue = Color(0xFFd8d9d9);
final Color blackTwo = Color(0xFF1a1a1a);
final Color greyishBrownTwo = Color(0xFF525252);
final Color iceBlue = Color(0xFFF1F2F2);
final Color cream = Color(0xFFfffcbd);

const MaterialColor primary = MaterialColor(
  0xFF03A9F4,
  <int, Color>{
    50: Color(0xFFE1F5FE),
    100: Color(0xFFB3E5FC),
    200: Color(0xFF81D4FA),
    300: Color(0xFF4FC3F7),
    400: Color(0xFF29B6F6),
    500: Color(0xFF03A9F4),
    600: Color(0xFF039BE5),
    700: Color(0xFF0288D1),
    800: Color(0xFF0277BD),
    900: Color(0xFF01579B),
  },
);
const MaterialColor secondary = MaterialColor(
  0xFFD8D9D9,
  <int, Color>{
    50: Color(0xFFF8F9F9),
    100: Color(0xFFF1F2F2),
    200: Color(0xFFE8E9E9),
    300: Color(0xFFD8D9D9),
    400: Color(0xFFB4B5B5),
    500: Color(0xFF949595),
    600: Color(0xFF6C6D6D),
    700: Color(0xFF585959),
    800: Color(0xFF3A3B3B),
    900: Color(0xFF1A1A1A),
  },
);

const MaterialColor coralTwo = MaterialColor(0xFFFF5A45, <int, Color>{
  200: Color(0xFFFF5A45),
});

// Black color opacity
final Color black = Color(0xFF000000);
final Color black10 = Color(0xFF000000).withOpacity(0.1);
final Color black12 = Color(0x1F000000);
final Color black26 = Color(0x42000000);
final Color black38 = Color(0x61000000);
final Color black45 = Color(0x73000000);
final Color black54 = Color(0x8A000000);
final Color black60 = Color(0xFF000000).withOpacity(0.6);
final Color black87 = Color(0xDD000000);

// White color opacity
final Color white = Color(0xFFFFFFFF);
final Color white10 = Color(0x1AFFFFFF);
final Color white12 = Color(0x1FFFFFFF);
final Color white24 = Color(0x3DFFFFFF);
final Color white30 = Color(0x4DFFFFFF);
final Color white38 = Color(0x62FFFFFF);
final Color white54 = Color(0x8AFFFFFF);
final Color white60 = Color(0x99FFFFFF);
final Color white87 = Color(0xFFFFFFFF).withOpacity(0.87);
final Color white90 = Color(0xFFFFFFFF).withOpacity(0.90);

// Primary color opacity
final Color primary38 = primaryColor.withOpacity(0.38);
final Color primary65 = primaryColor.withOpacity(0.65);
final Color primary87 = primaryColor.withOpacity(0.87);

// Secondary color opacity
final Color secondary38 = secondaryColor.withOpacity(0.38);
final Color secondary60 = secondaryColor.withOpacity(0.60);
final Color secondary87 = secondaryColor.withOpacity(0.87);

final linearGradient = LinearGradient(
// Where the linear gradient begins and ends
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
// Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.1, 1],
  colors: [
// Colors are easy thanks to Flutter's Colors class.
    Color(0xFF29B6F6),
    Color(0xFF0164CB)
  ],
);
