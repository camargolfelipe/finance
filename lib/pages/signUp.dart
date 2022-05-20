import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/forms/secondaryForm.dart';
import 'package:finance/components/template.dart';
import 'package:finance/helper/functions.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController finance = TextEditingController();
    TextEditingController emergency = TextEditingController();
    TextEditingController trade = TextEditingController();

    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Text("Antes de começarmos, me conte um pouco sobre você...".tr,
              style: TextStyle(color: thirdColor, fontSize: 20.0)),
          Divider(color: thirdColor),
          SecondaryForm('Nome'.tr + '*', name, 1, FontAwesomeIcons.user,
              TextInputType.name, false),
          SecondaryForm('Salário mensal'.tr + '*', finance, 1,
              FontAwesomeIcons.dollarSign, TextInputType.number, true),
          SecondaryForm('Perc. para Emergência'.tr + '*', emergency, 1,
              FontAwesomeIcons.percent, TextInputType.number, true),
          SecondaryForm('Perc. para Investimento'.tr + '*', trade, 1,
              FontAwesomeIcons.percent, TextInputType.number, true),
          Text("*" + "Todas as informações inseridas poderão ser modificadas.",
              style: TextStyle(color: thirdColor, fontSize: 12.0)),
          PrimaryButton('PRONTO'.tr, () {
            if (name.text.isEmpty ||
                finance.text.isEmpty ||
                emergency.text.isEmpty ||
                trade.text.isEmpty) {
              dialog(
                  context,
                  'Preencha todos os campos'.tr,
                  Text(
                    'É necessário preencher todos os campos para continuar o cadastro'
                        .tr,
                    style: TextStyle(color: white),
                  ));
            } else {
              storage.write('name', name.text);
              storage.write('finance', finance.text);
              storage.write('emergency', emergency.text);
              storage.write('trade', trade.text);
              simpleRoute(context, '/home');
            }
          }),
        ]),
      ),
    );
  }
}
