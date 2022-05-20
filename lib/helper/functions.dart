//ROUTE
import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';

dialog(context, String title, Widget content) {
  return showDialog(
      barrierColor: mainColor.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: secondColor,
            title: Text(
              title,
              style: TextStyle(color: thirdColor),
            ),
            content: content,
          ));
}
