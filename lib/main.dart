import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Utils/Router/router.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(appRouter: AppRouter(),connectivity: Connectivity(),), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {

  final AppRouter? appRouter;
  final Connectivity? connectivity;

  const MyApp({Key? key, this.appRouter, this.connectivity}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hydrated Bloc Boilerplate',
        debugShowCheckedModeBanner: !kReleaseMode,
        onGenerateRoute: appRouter!.onGeneratedRoute,
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}