import 'package:finance/helper/functions.dart';
import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  String label;
  int quantity;
  bool isVisible;
  Charts(this.label, this.quantity, this.isVisible);

  @override
  Widget build(BuildContext context) {
    var c = (quantity / int.parse(storage.read('finance'))) * 100;

    var a = 6 + int.parse(perc(c));
    var aa = 6 - int.parse(perc(c));
    var value = int.parse(storage.read('finance')) * (c / 100);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(label,
                style: TextStyle(color: thirdColor, fontSize: 14.0)),
          ),
          Expanded(
            flex: a,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 24.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: secondColor.withOpacity(0.5)),
            ),
          ),
          Expanded(
              flex: aa,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  isVisible
                      ? " R\$${value.toStringAsFixed(2)}"
                      : "${c.toStringAsFixed(2)}%",
                  style: TextStyle(color: thirdColor, fontSize: 8.0),
                ),
              ))
        ],
      ),
    );
  }
}
