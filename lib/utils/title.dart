

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends Text {

  TitleText({
    required data ,
    required Color color ,
    required double size ,
    required FontWeight weight ,
    TextAlign? textAlign,
    FontStyle? style , }) 
  :super(
    data,
    textAlign: textAlign,
    style : GoogleFonts.hind(
      color: color ,
      fontSize:size ,
      fontWeight :weight ,
      //overflow : TextOverflow.clip ,
    )
  );
}