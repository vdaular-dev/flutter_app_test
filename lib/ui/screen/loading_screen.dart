import 'package:flutter/material.dart';
import 'package:flutter_app_test/constant.dart';
import 'package:flutter_app_test/model/user.dart';
import 'package:flutter_app_test/ui/screen/main_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  User user = User();

  void getData() async {
    var userData = await user.readData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(
          userData: userData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          size: 60.0,
          color: kAccentColor,
        ),
      ),
    );
  }
}
