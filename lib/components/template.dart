import 'package:pattern/helper/preferences.dart';
import 'package:pattern/helper/routes.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  List<Widget> widget;
  Template(this.widget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            simpleRoute(context, '/ride');
          },
          backgroundColor: mainColor,
          child: Icon(
            Icons.directions_bike_sharp,
            color: white,
          ),
        ),
        backgroundColor: secondColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [mainColor, secondColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: widget),
          ),
        ));
  }
}
