import 'package:pattern/helper/preferences.dart';
import 'package:pattern/helper/routes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String title;
  String route;
  PrimaryButton(this.title, this.route);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        simpleRoute(context, route);
      },
      child: Container(
        height: 48.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(3, 5), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(10.0), color: mainColor),
        child: Text(
          title,
          style: const TextStyle(color: white, fontSize: 16.0),
        ),
      ),
    );
  }
}
