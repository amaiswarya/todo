import 'package:flutter/material.dart';
import 'package:todoapp/res/styles/color_palette.dart';
import 'package:todoapp/res/styles/fonts/font_text_styles.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Center(
        child: Text('NO ROUTE FOUND !', style: FontTextStyles.fWhite_14_400),
      ),
    );
  }
}
