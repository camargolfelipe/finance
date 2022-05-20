import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Charts extends StatelessWidget {
  String label;
  int quantity;
  bool isVisible;
  Charts(this.label, this.quantity, this.isVisible);

  @override
  Widget build(BuildContext context) {
    var valorTotal = quantity / int.parse(storage.read("finance"));
    var valorDespesa = isVisible
        ? 'R\$ $quantity,00'
        : '${(valorTotal * 100).toStringAsFixed(1)}%';
    var percentage = double.parse(valorTotal.toString());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: TextStyle(color: thirdColor, fontSize: 13.0))),
          Expanded(
            flex: 9,
            child: LinearPercentIndicator(
              curve: Curves.slowMiddle,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 1500,
              percent: percentage > 0.99 ? 1.0 : percentage,
              progressColor: percentage > 0.99 ? red : secondColor,
              backgroundColor: Colors.transparent,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(valorDespesa.toString(),
                  style: TextStyle(color: thirdColor, fontSize: 8.0))),
        ],
      ),
    );
  }
}
