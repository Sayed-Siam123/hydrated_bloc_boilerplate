import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/AboutScreen/about_screen.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/HomeScreen/home_screen.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/login_screen.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/SettingsScreen/settings_screen.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/SplashScreen/splash_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );

      case '/about':
        return MaterialPageRoute(
          builder: (_) => const AboutPage(),
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );

      case '/login':

        var arg = route.arguments as PageRouteArguments;

        return MaterialPageRoute(
          builder: (_) => LoginScreen(data: arg,),
        );

      case '/home':

        var arg = route.arguments as PageRouteArguments;

        return MaterialPageRoute(
          builder: (_) => HomePage(data: arg,),
        );

      default:
        return null;
    }
  }
}
