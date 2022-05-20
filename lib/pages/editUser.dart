import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/forms/secondaryForm.dart';
import 'package:finance/components/template.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../helper/functions.dart';

class EditUserPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController finance = TextEditingController();
  TextEditingController emergency = TextEditingController();
  TextEditingController trade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List a = storage.read("despesas") != null ? storage.read("despesas") : [];

    return Template(false, [
      Text("Editar dados".tr,
          style: TextStyle(color: thirdColor, fontSize: 24.0)),
      Divider(),
      EditUserItems(
          name, 'Nome'.tr + ' :: ${storage.read('name')} ', "name", false),
      EditUserItems(finance, 'Salário'.tr + ' :: ${storage.read('finance')},00',
          "finance", true),
      EditUserItems(
          emergency,
          'Emergência'.tr + ' :: ${storage.read('emergency')}%',
          "emergency",
          true),
      EditUserItems(trade, 'Investimento'.tr + ' :: ${storage.read('trade')}%',
          "trade", true),
      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: a.length,
          itemBuilder: (context, i) {
            return ExpensesItems(a[i]["name"], a[i]["perc"], a, i);
          },
        ),
      ),
    ]);
  }
}

class EditUserItems extends StatelessWidget {
  TextEditingController _controller;
  String label;
  String storageName;
  bool isNumberRestrict;

  EditUserItems(
      this._controller, this.label, this.storageName, this.isNumberRestrict);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: SecondaryForm(label, _controller, 1,
              FontAwesomeIcons.pencilAlt, TextInputType.name, isNumberRestrict),
        ),
        Expanded(
            flex: 2,
            child: PrimaryButton('EDITAR'.tr, () {
              if (_controller.text.isEmpty) {
                simpleRoute(context, '/editUser');
                dialog(
                    context,
                    'Preencha todos os campos'.tr,
                    Text(
                      'É necessário preencher todos os campos para continuar o cadastro'
                          .tr,
                      style: TextStyle(color: white),
                    ));
              } else {
                storage.write(storageName, _controller.text);
                simpleRoute(context, '/editUser');
              }
            })),
      ],
    );
  }
}

class ExpensesItems extends StatelessWidget {
  String label;
  int value;
  List list;
  int index;
  ExpensesItems(this.label, this.value, this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: mainColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: TextStyle(color: white),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              '\$ $value',
              style: TextStyle(color: white),
            ),
          ),
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {
                    list.removeAt(index);
                    storage.write('despesas', list);
                    simpleRoute(context, '/editUser');
                  },
                  icon: Icon(FontAwesomeIcons.times, size: 16, color: white)))
        ]),
      ),
    );
  }
}
