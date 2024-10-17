import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final List<Widget>? actions;

  const CommonAppBar({super.key, required this.text, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      backgroundColor: ColorPalette.primaryColor,
      foregroundColor: ColorPalette.white,
      title: Text(
        text,
        style: FontTextStyles.fWhite_24_400,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
