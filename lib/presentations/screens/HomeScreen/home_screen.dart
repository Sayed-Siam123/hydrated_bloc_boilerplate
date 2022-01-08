import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/base_widget.dart';
import 'package:hydrated_bloc_boilerplate/presentations/screens/LoginScreen/AuthBloc/auth_bloc.dart';
import 'package:provider/src/provider.dart';

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

  }

  @override
  Widget build(BuildContext context) {
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

              MaterialButton(
                onPressed: (){
                  context.read<AuthBloc>().add(Logout());

                  Navigator.popAndPushNamed(context, '/login',arguments: PageRouteArguments(
                    toPage: "/login",
                    fromPage: "/home",
                    data: ["data for login"],
                  ));


                },
                color: Colors.blue,
                child: const Text("Logout",style: TextStyle(color: Colors.white),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
