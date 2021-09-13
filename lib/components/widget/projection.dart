import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';

class Projection extends StatelessWidget {
  bool isVisible;
  Projection(this.isVisible);

  @override
  Widget build(BuildContext context) {
    var trade = int.parse(storage.read("finance")) *
        (int.parse(storage.read("trade")) / 100);
    var emergency = int.parse(storage.read("finance")) *
        (int.parse(storage.read("emergency")) / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Tempo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: thirdColor,
                      fontSize: 14.0),
                )),
                Expanded(
                    child: Text(
                  "Emergência (${storage.read("emergency")}%)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: thirdColor,
                      fontSize: 14.0),
                )),
                Expanded(
                    child: Text(
                  "Investimento (${storage.read("trade")}%)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: thirdColor,
                      fontSize: 14.0),
                )),
              ],
            ),
          ),
        ),
        Divider(),
        Text(
          "*Os valores abaixo não possuem nenhuma porcentagem de rendimento.",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: thirdColor, fontSize: 8.0),
        ),
        Container(
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              ProjectionItems(
                  '6 meses',
                  isVisible ? 'R\$ ${emergency * 6}' : "R\$ -",
                  isVisible ? 'R\$ ${trade * 6}' : "R\$ -"),
              ProjectionItems(
                  '1 ano',
                  isVisible ? 'R\$ ${emergency * 12}' : "R\$ -",
                  isVisible ? 'R\$ ${trade * 12}' : "R\$ -"),
              ProjectionItems(
                  '3 anos ',
                  isVisible ? 'R\$ ${emergency * 32}' : "R\$ -",
                  isVisible ? 'R\$ ${trade * 32}' : "R\$ -"),
              ProjectionItems(
                  '5 anos',
                  isVisible ? 'R\$ ${emergency * 60}' : "R\$ -",
                  isVisible ? 'R\$ ${trade * 60}' : "R\$ -"),
            ],
          ),
        )
      ],
    );
  }
}

class ProjectionItems extends StatelessWidget {
  String time;
  String emergency;
  String trade;
  ProjectionItems(this.time, this.emergency, this.trade);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                time,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: thirdColor.withOpacity(0.7)),
              )),
              Expanded(
                  child: Text(
                emergency,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: thirdColor.withOpacity(0.7)),
              )),
              Expanded(
                  child: Text(
                trade,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: thirdColor.withOpacity(0.7)),
              )),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
