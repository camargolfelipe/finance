import 'dart:convert';

import 'package:finance/components/buttons/primaryButton.dart';
import 'package:finance/helper/preferences.dart';
import 'package:finance/helper/routes.dart';
import 'package:finance/pages/foreign.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan/scan.dart';
import 'package:get/get.dart';

class QRCodePage extends StatelessWidget {
  ScanController _controller = ScanController();

  @override
  Widget build(BuildContext context) {
    List a = storage.read("despesas") != null ? storage.read("despesas") : [];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: thirdColor),
          leading: IconButton(
              enableFeedback: false,
              onPressed: () {
                simpleRoute(context, '/home');
              },
              icon: Icon(FontAwesomeIcons.home),
              color: thirdColor),
          backgroundColor: mainColor,
          bottom: TabBar(
            indicatorColor: thirdColor,
            tabs: [
              Tab(
                  icon: Icon(
                FontAwesomeIcons.qrcode,
                color: thirdColor,
              )),
              Tab(
                  icon: Icon(
                FontAwesomeIcons.camera,
                color: thirdColor,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    "Use esse QR Code para transferir suas informações ou compartilhar com seu conjuge. "
                        .tr,
                    style: TextStyle(color: thirdColor, fontSize: 18.0)),
              ),
              Divider(),
              SizedBox(height: 40.0),
              QrImage(
                backgroundColor: white,
                data: jsonEncode({
                  "user": {
                    "name": storage.read('name'),
                    "finance": storage.read('finance'),
                    "emergency": storage.read('emergency'),
                    "trade": storage.read('trade')
                  },
                  "expends": a
                }),
                version: QrVersions.auto,
                size: 240.0,
              ),
            ]),
            SizedBox(
              height: 80.0,
              child: ScanView(
                controller: _controller,
                scanAreaScale: .7,
                scanLineColor: thirdColor,
                onCapture: (data) {
                  var a = jsonDecode(data);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: secondColor,
                            title: Text(
                                'Deseja unir seus dados com'.tr +
                                    ' ${a["user"]["name"]}?',
                                style: TextStyle(
                                  color: thirdColor,
                                  fontSize: 12.0,
                                )),
                            actions: [
                              PrimaryButton('SIM'.tr, () {
                                constructRoute(context, ForeignUser(data));
                              }),
                              PrimaryButton('NÃO'.tr, () {
                                Navigator.pop(context);
                              }),
                            ],
                          ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
