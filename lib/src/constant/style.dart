import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programming_stars/src/config/dimention.dart';
import 'package:programming_stars/src/constant/app_color.dart';

final robotoRegular = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeDefault,
  ),
);

final robotoMedium = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeDefault,
  ),
);

final robotoBold = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.primaryGrayColor,
    fontSize: Dimensions.fontSizeDefault,
  ),
);

final robotoBlack = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w900,
    fontSize: Dimensions.fontSizeDefault,
  ),
);
