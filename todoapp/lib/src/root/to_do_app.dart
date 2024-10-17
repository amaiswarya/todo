import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/res/constants/app_constants.dart';
import 'package:todoapp/utils/helpers/multi_provider.dart';
import 'package:todoapp/utils/routes/route_constants.dart';
import 'package:todoapp/utils/routes/route_generator.dart';

class ToDoApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MultiProvider(
        providers: MultiProviderClass.providerLists,
        child: MaterialApp(
          title: AppConstants.appName,
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: _auth.currentUser != null
              ? RouteConstants.routehomeScreen
              : RouteConstants.routeInitial,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery.withClampedTextScaling(
              minScaleFactor: 0.75,
              maxScaleFactor: 1.4,
              child: child ?? const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
