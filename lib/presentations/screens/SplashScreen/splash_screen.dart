import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/AuthBloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2)).then((value) {

      final authState = context.read<AuthBloc>().state;

      print(authState);

      if(authState is UserAuthenticate){
        Navigator.popAndPushNamed(context, '/home',arguments: PageRouteArguments(
          toPage: "/home",
          fromPage: "/splash",
          data: ["User Authenticated"],
        ));
      }

      else if(authState is UserUnAuthenticate){
        Navigator.popAndPushNamed(context, '/login',arguments: PageRouteArguments(
          toPage: "/login",
          fromPage: "/splash",
          data: ["data for login"],
        ));
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: const Text(
        "Title",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
    );
  }
}
