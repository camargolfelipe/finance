import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';

class SecondaryForm extends StatelessWidget {
  String label;
  TextEditingController controller;
  int maxLines;
  IconData prefixIcon;
  TextInputType keyboardType;
  SecondaryForm(this.label, this.controller, this.maxLines, this.prefixIcon,
      this.keyboardType);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        controller: controller,
        style: TextStyle(color: thirdColor, fontSize: 16.0),
        decoration: InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              prefixIcon,
              color: thirdColor,
            ),
          ),
          filled: true,
          labelText: label,
          labelStyle: TextStyle(color: thirdColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: grey,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
