import 'package:flutter/material.dart';

class PrimaryForm extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  Color color;
  String label;
  PrimaryForm(this.label, this.controller, this.obscureText, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: color),
        decoration: InputDecoration(
            helperStyle: TextStyle(color: color),
            focusColor: color,
            labelText: label,
            enabledBorder: new UnderlineInputBorder(
                borderSide: new BorderSide(color: color)),
            labelStyle: TextStyle(color: color)),
      ),
    );
  }
}
