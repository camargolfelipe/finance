import 'package:pattern/helper/preferences.dart';
import 'package:flutter/material.dart';

class SecondaryForm extends StatelessWidget {
  String label;
  TextEditingController controller;
  int maxLines;
  IconData prefixIcon;
  SecondaryForm(this.label, this.controller, this.maxLines, this.prefixIcon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          style: TextStyle(color: white, fontSize: 16.0),
          decoration: InputDecoration(
            prefix: Icon(
              prefixIcon,
              color: thirdColor,
            ),
            filled: true,
            labelText: label,
            labelStyle: TextStyle(color: white),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secondColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: grey,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
