import 'package:finalproject/page/AccountScreen.dart';
import 'package:finalproject/page/GetStarted.dart';
import 'package:finalproject/page/HomeScreen.dart';
import 'package:finalproject/page/LoginScreen.dart';
import 'package:finalproject/page/NewsScreen.dart';
import 'package:finalproject/page/RegisterScreen.dart';
import 'package:finalproject/page/SplashScreen.dart';
import 'package:finalproject/routes/route_name.dart';
import 'package:get/get.dart';

class pageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.splashscreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.getstarted,
      page: () => GetStarted(),
    ),
    GetPage(
      name: RouteName.loginscreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.registerscreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RouteName.homescreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteName.newsscreen,
      page: () => NewsScreen(),
    ),
    GetPage(
      name: RouteName.account,
      page: () => AccountScreen(),
    ),
  ];
}
