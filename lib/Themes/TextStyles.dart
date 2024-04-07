import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmuni_project/Themes/Colors.dart';

TextStyle title({
  double size=20,
  Color color=AppColors.title,
  bool bold=false
}){
  return GoogleFonts.montserrat().copyWith(
    fontSize:size,
    fontWeight: bold?FontWeight.bold:FontWeight.normal,
    color: color
  );
}TextStyle heading({
  double size=20,
  Color color=AppColors.title,
  bool bold=false
}){
  return GoogleFonts.poppins().copyWith(
    fontSize:size,
    fontWeight: bold?FontWeight.bold:FontWeight.normal,
    color: color
  );
}
TextStyle hindiFont({
  double size=20,
  Color color=AppColors.title,
  bool bold=false
}){
  return TextStyle(
    fontSize:size,
    fontWeight: bold?FontWeight.bold:FontWeight.normal,
    color: color,
    fontFamily: 'AmsUmakant'
  );
}
