import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/res/styles/color_palette.dart';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

void showToast({String? msg, bool? isError = true}) {
  Fluttertoast.showToast(
      msg: msg!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: ColorPalette.white,
      textColor: isError! ? ColorPalette.red : ColorPalette.primaryColor,
      fontSize: 14.sp);
}

void afterInit(Function function) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    function.call();
  });
}

SystemUiOverlayStyle get systemOverlayStyle => Platform.isAndroid
    ? const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ColorPalette.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: ColorPalette.white,
        systemNavigationBarColor: ColorPalette.white)
    : const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark);

SystemUiOverlayStyle get systemOverlayStyleTransparent =>
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
