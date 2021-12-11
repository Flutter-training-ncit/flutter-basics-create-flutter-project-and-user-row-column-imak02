import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:tiktok_apk/list.dart';
import 'package:tiktok_apk/login_page.dart';
import 'package:tiktok_apk/screen/splash_screen.dart';
import 'package:tiktok_apk/tiktok_apk_main.dart';

Route ourRouteGenerator(RouteSettings setting) {
  switch (setting.name) {
    case "/splash_screen":
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case "/listing_screen":
      return MaterialPageRoute(builder: (context) => ListLearning());

    case "/login_screen":
      return MaterialPageRoute(builder: (context) => LoginScreen());

    default:
      return MaterialPageRoute(builder: (context) => TiktokApk());
  }
}
