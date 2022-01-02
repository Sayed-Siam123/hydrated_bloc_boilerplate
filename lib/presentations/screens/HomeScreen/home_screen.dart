import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';
import 'package:hydrated_bloc_boilerplate/presentations/base_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.data}) : super(key: key);

  final PageRouteArguments? data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Text(widget.data!.fromPage.toString()),
              Text(widget.data!.data![0].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
