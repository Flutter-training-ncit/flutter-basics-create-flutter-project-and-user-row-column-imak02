import 'package:flutter/material.dart';
import 'package:tiktok_apk/login_page.dart';
// import 'package:tiktok_apk/list.dart';
import 'package:tiktok_apk/tiktok_apk_main.dart';
import 'package:tiktok_apk/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUsersLoggedInStatusAndNavigate();
  }

  /// fetch the user's loggd in status from Shared Preferences
  /// and navigate tot the correct page
  getUsersLoggedInStatusAndNavigate() async {
    final isLoggedIn = await SharedPref.getHasUserLoggedIn();

    if (isLoggedIn) {
      //
      // There are two types of routes that we know:
      // 1. MaterialPageRoute
      // 2. CupertinoPageRoute
      await Future.delayed(const Duration(seconds: 2), () {
        //  navigation without named routes
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (ctx) => ListLearning()));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const TiktokApk(),
            ));
      });
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const LoginScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.ad_units,
          size: 40,
          color: Colors.purple,
        ),
      ),
    );
  }
}
