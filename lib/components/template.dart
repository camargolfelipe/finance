import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/components/forms/primaryForm.dart';
import 'package:finance/helper/functions.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Template extends StatefulWidget {
  var isHome;
  List<Widget> widget;
  Template(this.isHome, this.widget);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  TextEditingController _title = TextEditingController();
  TextEditingController _value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List list =
        storage.read("despesas") != null ? storage.read("despesas") : [];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialog(
                context,
                'Adicionar despesa'.tr,
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(color: secondColor),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PrimaryForm('Titulo'.tr, _title, false, thirdColor,
                            TextInputType.name, false),
                        PrimaryForm('Valor'.tr, _value, false, thirdColor,
                            TextInputType.number, true),
                        PrimaryButton('Adicionar'.tr, () {
                          setState(() {
                            list.add({
                              "name": _title.text,
                              "perc": int.parse(_value.text)
                            });
                            storage.write('despesas', list);
                            simpleRoute(context, '/home');
                          });
                        })
                      ],
                    ),
                  ),
                ));
          },
          backgroundColor: mainColor,
          child: Icon(
            FontAwesomeIcons.dollarSign,
            color: thirdColor,
          ),
        ),
        backgroundColor: secondColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  simpleRoute(context, '/qrcode');
                },
                icon: Icon(FontAwesomeIcons.qrcode)),
            IconButton(
                onPressed: () {
                  dialog(
                      context,
                      'Configurações'.tr,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(color: secondColor),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Linguagem'.tr,
                                  style: TextStyle(color: thirdColor),
                                ),
                              ),
                              Row(children: [
                                Expanded(
                                  child: PrimaryButton('PT-BR', () {
                                    Get.updateLocale(Locale('pt', 'BR'));
                                    // storage.write("lang", [Locale('pt', 'BR')]);
                                  }),
                                ),
                                Expanded(
                                  child: PrimaryButton('EN-US', () {
                                    Get.updateLocale(Locale('en', 'US'));
                                    // storage.write("lang", [Locale('en', 'US')]);
                                  }),
                                ),
                                Expanded(
                                  child: PrimaryButton('ES', () {
                                    Get.updateLocale(Locale('es', 'ES'));
                                    // storage.write("lang", [Locale('es', 'ES')]);
                                  }),
                                ),
                              ]),
                              Divider(color: thirdColor),
                            ],
                          ),
                        ),
                      ));
                },
                icon: Icon(FontAwesomeIcons.cog)),
            IconButton(
                onPressed: () {
                  simpleRoute(context, '/info');
                },
                icon: Icon(FontAwesomeIcons.info)),
          ],
          iconTheme: IconThemeData(
              color: widget.isHome == null ? Colors.transparent : thirdColor),
          leading: IconButton(
              enableFeedback: false,
              onPressed: () {
                widget.isHome == null
                    ? print("Click")
                    : simpleRoute(
                        context, widget.isHome ? '/editUser' : '/home');
              },
              icon: widget.isHome
                  ? Icon(FontAwesomeIcons.userEdit)
                  : Icon(FontAwesomeIcons.home),
              color: thirdColor),
          backgroundColor: mainColor,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [mainColor, secondColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: widget.widget),
          ),
        ));
  }
}
