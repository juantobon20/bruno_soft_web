import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFont {

  static final titleStyle = GoogleFonts.eczar(
    fontSize: 28,
    fontWeight: FontWeight.bold
  );

  static final primaryStyle = GoogleFonts.eczar(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  static TextStyle secondaryStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  static final tertiaryStyle = GoogleFonts.merriweather(
    fontSize: 14,
    fontWeight: FontWeight.normal
  );

  static final textFieldStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal
  );

  static final buttonStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
}