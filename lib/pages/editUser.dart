import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/forms/secondaryForm.dart';
import 'package:finance/components/template.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditUserPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController finance = TextEditingController();
  TextEditingController emergency = TextEditingController();
  TextEditingController trade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List a = storage.read("despesas") != null ? storage.read("despesas") : [];

    return Template(false, [
      Text("Editar dados", style: TextStyle(color: thirdColor, fontSize: 24.0)),
      Divider(),
      EditUserItems(name, 'Nome :: ${storage.read('name')} ', "name"),
      EditUserItems(
          finance, 'Salário :: ${storage.read('finance')},00', "finance"),
      EditUserItems(emergency, 'Emergência :: ${storage.read('emergency')}%',
          "emergency"),
      EditUserItems(
          trade, 'Investimento :: ${storage.read('trade')}%', "trade"),
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
  EditUserItems(this._controller, this.label, this.storageName);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: SecondaryForm(label, _controller, 1,
              FontAwesomeIcons.pencilAlt, TextInputType.name),
        ),
        Expanded(
            flex: 2,
            child: PrimaryButton('EDITAR', () {
              storage.write(storageName, _controller.text);
              simpleRoute(context, '/editUser');
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
              'R\$ $value',
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
