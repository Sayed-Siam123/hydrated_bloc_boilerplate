import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/HomeScreen/home_screen.dart';

class AppRouter {

  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case '/':

        //route.arguments as

        return MaterialPageRoute(
              builder: (_) => const HomePage(),
        );
      default:
        return null;
    }
  }
}