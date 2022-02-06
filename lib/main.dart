import 'package:flutter/material.dart';
import 'package:newsapp1/screens/home_screen.dart';
import 'package:newsapp1/screens/onboarding.dart';
import 'package:newsapp1/utilities/app_theme.dart';

main() {
  // SharedPreferences prefs = await SharedPreferences.getInstance(); async
  // bool seen = prefs.getBool('seen');

  // Widget _screen;

  // if (seen == null || seen == false) {
  //   _screen = OnBoarding();
  // } else {
  //   _screen = HomeScreen();
  // }

  // runApp(NewsApp(_screen));
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  // final Widget _screen;

  // NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.appTheme,
      // home: this._screen,

      home: OnBoarding(),
    );
  }
}





