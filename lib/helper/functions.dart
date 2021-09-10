//ROUTE
import 'package:flutter/material.dart';

dialog(context, String title, Widget content) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: content,
          ));
}
