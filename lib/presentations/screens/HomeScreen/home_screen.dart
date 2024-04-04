import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/base_widget.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/HomeScreen/HomeBloc/home_bloc.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/HomeScreen/HomeBloc/home_state.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/AuthBloc/auth_bloc.dart';
import 'package:provider/src/provider.dart';

import 'HomeBloc/home_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.data}) : super(key: key);

  final PageRouteArguments? data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final authState = context.read<AuthBloc>().state;

    if(authState is UserAuthenticate){
      setState(() {
        email = authState.user!.email;
      });
    }

    context.read<HomeBloc>().add(FetchTime());

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,HomePageState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return BaseWidget(
          builder: (context, sizingInformation) => Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(email.toString()),
                  Text(widget.data!.fromPage.toString()),
                  Text(widget.data!.data![0].toString()),

                  (state is HomeTimeLoaded) ? Text(state.data!.time.toString()) : Text("Default"),

                  SizedBox(height: 300,),

                  BlocBuilder(
                    bloc: context.read<AuthBloc>(),
                    builder: (context, state) {
                      Widget widget = SizedBox();
                      if(state is UserAuthenticate){
                        widget = ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(Logout());
                            Navigator.popAndPushNamed(context, '/login',arguments: PageRouteArguments(
                              toPage: "/login",
                              fromPage: "/home",
                              data: ["data for login"],
                            ));
                          },
                          child: Text("Logout"),
                        );
                      }
                      return widget;
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
