import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInkwellWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? fontSize;
  final String text;
  const CustomInkwellWidget(
      {super.key,
      this.buttonColor,
      this.textColor,
      this.onTap,
      this.fontSize,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor),
          ),
        ),
      ),
    );
  }
}
