import 'package:flutter/material.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  const PrimaryButton(
      {super.key, required this.text, this.onTap, this.style, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style,
        onPressed: onTap,
        child: Text(
          text,
          style: textStyle ?? FontTextStyles.findigo_18_500,
        ));
  }
}
