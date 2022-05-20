import 'package:finance/components/widget/charts.dart';
import 'package:finance/components/widget/projection.dart';
import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:finance/components/template.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  List a = storage.read("despesas") != null ? storage.read("despesas") : [];
  var emergency =
      '${((int.parse(storage.read("finance")) * (int.parse(storage.read("emergency")))) ~/ 100)}';
  var trade =
      '${((int.parse(storage.read("finance")) * (int.parse(storage.read("trade")))) ~/ 100)}';
  total() {
    var total = 0.00;
    for (var i = 0; i < a.length; i++) {
      total = total + a[i]["perc"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Template(true, [
      Row(
        children: [
          Expanded(
            flex: 9,
            child: Text("Olá".tr + ' ${storage.read('name')}',
                style: TextStyle(color: thirdColor, fontSize: 24.0)),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: thirdColor,
                  size: 20.0,
                ),
              ))
        ],
      ),
      Divider(color: thirdColor),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Suas despesas".tr,
            style: TextStyle(
                color: thirdColor,
                fontSize: 16.0,
                fontStyle: FontStyle.italic)),
      ),
      Container(
        decoration: BoxDecoration(
          color: white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Charts("Emergência".tr, int.parse(emergency), isVisible),
                    Charts("Investimento".tr, int.parse(trade), isVisible),
                  ],
                )),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: a.length,
                itemBuilder: (context, i) {
                  return Charts(a[i]["name"], a[i]["perc"], isVisible);
                },
              ),
            ),
          ],
        ),
      ),
      Row(children: [
        Expanded(
            child: HomeItems(
                "Dinheiro livre".tr + " :",
                isVisible,
                "\$ ${int.parse(storage.read('finance')) - (total() + int.parse(trade) + int.parse(emergency))}",
                black)),
        Expanded(
            child: HomeItems("Dinheiro Investido".tr + " :", isVisible,
                "\$ ${int.parse(trade) + int.parse(emergency)}", blue)),
        Expanded(
            child: HomeItems(
                "Total de despesas".tr + " :", isVisible, "\$ ${total()}", red))
      ]),
      Projection(isVisible),
      SizedBox(height: 32.0)
    ]);
  }
}

class HomeItems extends StatelessWidget {
  String label;
  bool isVisible;
  String value;
  Color color;
  HomeItems(this.label, this.isVisible, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      color: thirdColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 8.0)),
              Text(isVisible ? value : "\$ -",
                  style: TextStyle(
                      color: thirdColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
