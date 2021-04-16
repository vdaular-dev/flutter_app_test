import 'package:flutter/material.dart';
import 'package:flutter_app_test/constant.dart';
import 'package:flutter_app_test/ui/screen/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: CHANGE TO BLoC STATE MANAGEMENT!
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          primaryIconTheme: IconThemeData(color: kAccentColor),
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: kAccentColor))),
      home: LoadingScreen(),
    );
  }
}
