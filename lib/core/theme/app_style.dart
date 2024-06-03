import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle header = GoogleFonts.robotoSerif(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle body = GoogleFonts.robotoSerif(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle subbody = GoogleFonts.robotoSerif(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );

  static TextStyle display = GoogleFonts.katibeh(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle button = GoogleFonts.katibeh(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle span = GoogleFonts.robotoSlab(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle infoTitle = GoogleFonts.robotoSlab(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle infoBody = GoogleFonts.robotoSlab(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );

  static TextStyle cardTitle = GoogleFonts.robotoSlab(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle cardSubtitle = GoogleFonts.robotoSerif(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
