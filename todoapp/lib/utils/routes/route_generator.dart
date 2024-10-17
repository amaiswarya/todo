import 'package:flutter/cupertino.dart';
import 'package:todoapp/src/auth/view/login_screen.dart';
import 'package:todoapp/src/auth/view/sign_up_screen.dart';
import 'package:todoapp/src/home/view/home_screen.dart';
import 'package:todoapp/utils/common_widgets/empty_screen.dart';
import 'package:todoapp/utils/routes/route_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.routeInitial:
        return _buildRoute(RouteConstants.routeInitial, SignUpScreen());
      case RouteConstants.routeloginScreen:
        return _buildRoute(RouteConstants.routeloginScreen, LoginScreen());
      case RouteConstants.routehomeScreen:
        return _buildRoute(RouteConstants.routehomeScreen, HomeScreen());

      default:
        return _buildRoute(RouteConstants.routeEmpty, const EmptyScreen());
    }
  }
}

Route _buildRoute(String route, Widget widget,
    {bool enableFullScreen = false}) {
  return CupertinoPageRoute(
      fullscreenDialog: enableFullScreen,
      settings: RouteSettings(name: route),
      builder: (_) => widget);
}
