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

perc(value) {
  if (value <= 3) {
    return '-5';
  } else if (value > 3 && value <= 11) {
    return '-4';
  } else if (value > 11 && value <= 20) {
    return '-3';
  } else if (value > 20 && value <= 32) {
    return '-2';
  } else if (value > 32 && value <= 40) {
    return '-1';
  } else if (value > 40 && value <= 48) {
    return '0';
  } else if (value > 48 && value <= 56) {
    return '1';
  } else if (value > 56 && value <= 64) {
    return '2';
  } else if (value > 64 && value <= 72) {
    return '3';
  } else if (value > 72 && value <= 80) {
    return '4';
  } else if (value > 80 && value <= 88) {
    return '5';
  } else if (value > 88 && value <= 96) {
    return '6';
  } else {
    return '7';
  }
}
