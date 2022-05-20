import 'package:finance/components/transition.dart';
import 'package:finance/pages/editUser.dart';
import 'package:finance/pages/home.dart';
import 'package:finance/pages/info.dart';
import 'package:finance/pages/qrcode.dart';
import 'package:finance/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final appRoutes = {
  '/': (context) => TransitionPage(),
  '/editUser': (context) => EditUserPage(),
  '/home': (context) => HomePage(),
  '/info': (context) => InfoPage(),
  '/qrcode': (context) => QRCodePage(),
  '/signUp': (context) => SignUp(),
};

//FUNCTIONS

simpleRoute(context, String route) {
  return Navigator.pushNamed(context, route);
}

constructRoute(context, Widget route) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

webRoute(url) async {
  return await canLaunch(url)
      ? await launch(url)
      : throw 'Could not launch $url';
}
