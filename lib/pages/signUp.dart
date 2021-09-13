import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/forms/secondaryForm.dart';
import 'package:finance/components/template.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return Template(false, [
      Text("Antes de começarmos, me conte um pouco sobre você...",
          style: TextStyle(color: thirdColor, fontSize: 20.0)),
      Divider(color: thirdColor),
      SecondaryForm(
          'Nome*', name, 1, FontAwesomeIcons.user, TextInputType.name),
      SecondaryForm('Salário mensal*', finance, 1, FontAwesomeIcons.dollarSign,
          TextInputType.number),
      SecondaryForm('Perc. para Emergência*', emergency, 1,
          FontAwesomeIcons.percent, TextInputType.number),
      SecondaryForm('Perc. para Investimento*', trade, 1,
          FontAwesomeIcons.percent, TextInputType.number),
      Text("* Todas as informações inseridas poderão ser modificadas.",
          style: TextStyle(color: thirdColor, fontSize: 12.0)),
      PrimaryButton('PRONTO', () {
        storage.write('name', name.text);
        storage.write('finance', finance.text);
        storage.write('emergency', emergency.text);
        storage.write('trade', trade.text);

        simpleRoute(context, '/home');
      }),
    ]);
  }
}
