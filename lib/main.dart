import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/HomeScreen/HomeBloc/home_bloc.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/AuthBloc/auth_bloc.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/LoginBloc/login_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'Utils/Router/router.dart';
import 'data/dataprovider/api_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(() =>
      runApp(DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
            MyApp(appRouter: AppRouter(),
              connectivity: Connectivity(),), // Wrap your app
      ),),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {

  final AppRouter? appRouter;
  final Connectivity? connectivity;

  const MyApp({Key? key, this.appRouter, this.connectivity}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),

        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),

        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(apiProvider: ApiProvider()),
        ),
      ],
      child: MaterialApp(
        title: 'Hydrated Bloc Boilerplate',
        debugShowCheckedModeBanner: !kReleaseMode,
        onGenerateRoute: appRouter!.onGeneratedRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}