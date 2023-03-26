import 'package:flutter/material.dart';
import 'package:hereis/pages/splash_page.dart';

import '../../pages/home/home_page.dart';

class Routes {
  static const splashPage = "/";
  static const home = "/home/";

  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomePage(),
    splashPage: (context) => const SplashPage()
  };
}
