import 'package:flutter/material.dart';
import 'package:hydrated_bloc_boilerplate/data/Model/page_route_arguments.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.data}) : super(key: key);

  final PageRouteArguments? data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(widget.data!.fromPage.toString()),
        ],
      ),
    );
  }
}
