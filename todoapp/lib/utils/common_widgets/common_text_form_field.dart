import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? obscure;
  final TextStyle? style;
  final Color? borederColor;

  const CommonTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscure,
      this.style,
      this.borederColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: style ?? FontTextStyles.fWhite_16_300,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(color: borederColor ?? ColorPalette.white60)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          labelText: labelText,
          labelStyle: FontTextStyles.fWhite60_14_300),
    );
  }
}
