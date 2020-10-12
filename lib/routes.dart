import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_white_label/screens/cart/cart.dart';
import 'package:flutter_white_label/screens/dashboard/dashboard.dart';
import 'package:flutter_white_label/screens/login/login.dart';
import 'package:flutter_white_label/screens/profile/profile.dart';
import 'package:flutter_white_label/screens/register/register.dart';

class Routes {
  /// avoid instantiate class
  Routes._();

  /// static variables
  static const String SPLASH = '/splash';
  static const String REGISTER = '/register';
  static const String LOGIN = '/login';
  static const String DASHBOARD = '/dashboard';
  static const String PROFILE = '/profile';
  static const String CART = '/cart';

  /// routes screen
  static final routes = <String, WidgetBuilder>{
    DASHBOARD: (BuildContext context) => DashboardScreen(),
    REGISTER: (BuildContext context) => RegisterScreen(),
    LOGIN: (BuildContext context) => LoginScreen(),
    PROFILE: (BuildContext context) => ProfileScreen(),
    CART: (BuildContext context) => CartScreen(),
  };
}
