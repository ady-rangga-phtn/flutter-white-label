import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_white_label/app_state/app_state.dart';
import 'package:flutter_white_label/app_state/cart_state.dart';
import 'package:flutter_white_label/constants/strings.dart';
import 'package:flutter_white_label/routes.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.DASHBOARD,
      routes: Routes.routes,
    );
  }
}