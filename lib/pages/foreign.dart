import 'dart:convert';
import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/template.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForeignUser extends StatelessWidget {
  String list;
  ForeignUser(this.list);

  @override
  Widget build(BuildContext context) {
    List newExpenses = [];
    List expenses =
        storage.read("despesas") != null ? storage.read("despesas") : [];
    var name = storage.read('name');
    var finance = storage.read('finance');
    var emergency = storage.read('emergency');
    var trade = storage.read('trade');
    var a = jsonDecode(list);
    return Template(false, [
      ForeignItems('Nome'.tr + ':', a["user"]["name"]),
      ForeignItems('Salário'.tr + ':', a["user"]["finance"] + ',00'),
      ForeignItems(
          'Perc. de Emergência'.tr + ':', a["user"]["emergency"] + '%'),
      ForeignItems('Perc. de Investimento'.tr + ':', a["user"]["trade"] + '%'),
      Container(
        decoration: BoxDecoration(
            color: thirdColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: a["expends"].length,
          itemBuilder: (context, i) {
            return ForeignItems(
                a["expends"][i]["name"], '${a["expends"][i]["perc"]},00');
          },
        ),
      ),
      SizedBox(height: 64.0),
      PrimaryButton('Transferir Informações'.tr, () {
        newExpenses.addAll(expenses);
        newExpenses.addAll(a["expends"]);
        storage.write('despesas', newExpenses);
        simpleRoute(context, '/home');
      })
    ]);
  }
}

class ForeignItems extends StatelessWidget {
  String label;
  String value;
  ForeignItems(this.label, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              label,
              style: TextStyle(color: thirdColor, fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: Text(
              value,
              style: TextStyle(color: thirdColor),
            ))
          ],
        ),
      ),
    );
  }
}

merge(a, name, finance, emergency, trade) {
  var f = int.parse('$finance') + int.parse('${a["user"]["finance"]}');
  var e = emergency > int.parse('${a["user"]["emergency"]}')
      ? emergency
      : a["user"]["emergency"];
  var t = trade > a["user"]["trade"] ? trade : a["user"]["trade"];

  storage.write('name', '$name & ${a["user"]["emergency"]}');
  storage.write('finance', '$f');
  storage.write('emergency', '$e');
  storage.write('trade', '$t');
}
