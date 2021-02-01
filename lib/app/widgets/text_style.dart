import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Style {
  static final baseTextStyle = GoogleFonts.notoSans(locale: Locale('ja', 'JP'));
  static final baseRobotoTextStyle =
  GoogleFonts.roboto(locale: Locale('ja', 'JP'));
  static final baseUbuntuTextStyle =
  GoogleFonts.ubuntu(locale: Locale('ja', 'JP'));

  static final overLineTextStyle = baseTextStyle.copyWith(
      fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 2);

  static final captionTextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final captionRobotoTextStyle = baseRobotoTextStyle.copyWith(
      color: black60,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final miniTextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final hintTextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.21);

  static final hint15TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.21);

  static final buttonTextStyle = baseTextStyle.copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 1.25);

  static final subType2TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1);

  static final subType1TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15);

  static final article2TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final article3TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final articleUbuntu2TextStyle = baseUbuntuTextStyle.copyWith(
      color: black60,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final article1TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final article15TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.27);

  static final article0TextStyle = baseTextStyle.copyWith(
      color: black60,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h7TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h7TextStyleUbuntu = baseUbuntuTextStyle.copyWith(
      color: black87,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h6TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h5TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h55TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h56TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 26.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h4TextStyle = baseTextStyle.copyWith(
      color: black87,
      fontSize: 30.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static final h2TextStyle = baseTextStyle.copyWith(
    color: black87,
    fontSize: 34.0,
    fontWeight: FontWeight.w400,
  );
  static final h21TextStyle = baseTextStyle.copyWith(
    color: black87,
    fontSize: 38.0,
    fontWeight: FontWeight.w400,
  );

  static final h1TextStyle = baseTextStyle.copyWith(
    color: black87,
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
  );

  static final h14TextStyle = baseTextStyle.copyWith(
    color: black87,
    fontSize: 40.0,
    fontWeight: FontWeight.w400,
  );

  static final h15TextStyle = baseTextStyle.copyWith(
    color: black87,
    fontSize: 42.0,
    fontWeight: FontWeight.w400,
  );

  static final h4UbuntuTextStyle = baseUbuntuTextStyle.copyWith(
      color: black87,
      fontSize: 30.0,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.25);
}
