import 'package:flutter/material.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CommonTextButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: FontTextStyles.findigo_18_400,
        ));
  }
}
