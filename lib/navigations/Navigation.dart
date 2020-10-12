import 'package:flutter/material.dart';
import 'package:flutter_white_label/app_state/app_state.dart';
import 'package:flutter_white_label/routes.dart';
import 'package:provider/provider.dart';

/// navigation management
/// avoid duplicate route in same time
class Navigation {
  Navigation(this.context);

  final BuildContext context;

  void to(String nextRoute) {
    String currentRoute = ModalRoute.of(context).settings.name;
    bool isLoggedIn = checkLoggedIn();
    print('isLoggedIn > $isLoggedIn > ${!isLoggedIn}');
    if (!isLoggedIn) nextRoute = Routes.LOGIN;
    bool isMatch = checkMatches(currentRoute, nextRoute);
    /// avoid duplicate route in same time
    if (isMatch) Navigator.pushReplacementNamed(context, nextRoute);
    /// move to nextRoute
    else Navigator.pushNamed(context, nextRoute);
  }

  bool checkMatches(String currentRoute, String nextRoute) {
    if (currentRoute == nextRoute) return true;
    return false;
  }

  bool checkLoggedIn() {
    bool isLoggedIn = context.read<AppState>().selectIsLoggedIn;
    return isLoggedIn;
  }
}