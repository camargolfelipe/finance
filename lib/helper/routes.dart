import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final appRoutes = {
  '/': (context) => Container(),
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
