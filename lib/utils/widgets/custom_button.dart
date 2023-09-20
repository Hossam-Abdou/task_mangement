import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/custom_colors.dart';

class CustomButton extends StatelessWidget {
String? text;
Color? color;

CustomButton({this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      color: color??CustomColors.primaryButton,
      child: Center(
          child: Text(
            text!,
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 14.sp),
          )),
    );
  }
}
