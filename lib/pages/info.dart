import 'package:clipboard/clipboard.dart';
import 'package:finance/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var isCopied = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Espero que tenha gostado do app!".tr,
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 18.0,
                )),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(),
            ),
            Text(
                "Esse aplicativo foi desenvolvido inicialmente para uso pessoal e após meses de testes e uso cotidiano, publicado para auxiliar toda a comunidade.\nFoi idealizado e desenvolvido por Luis Felipe Camargo, com o intuito de auxiliar os usuários a realizar suas contas financeiras de forma fácil e rápida.\n\nO desenvolvimento foi realizado em linguagem Dart, utilizando Flutter. Se houver alguma dúvida, sugestão, elogio ou crítica, peço para entrar em contato comigo atraves do Google Play Store, avaliar o App e deixar seu comentário.\n\nObrigado por usar o app!",
                style: TextStyle(
                  color: white,
                  fontSize: 16.0,
                )),
            Text(
                "\nSe, de alguma forma ele te ajudou, é uma imensa alegria e satisfação!\nCaso queira contribuir com meu trabalho, segue abaixo minha chave Pix :)\n ",
                style: TextStyle(
                  color: thirdColor,
                  fontSize: 12.0,
                )),
            GestureDetector(
              onTap: () {
                FlutterClipboard.copy('eb84e138-7b2f-4698-be13-a99c79d665d5');
                setState(() {
                  isCopied = true;
                });
              },
              child: Row(
                children: [
                  Text("\n eb84e138-7b2f-4698-be13-a99c79d665d5 ",
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold)),
                  Icon(FontAwesomeIcons.copy, color: thirdColor, size: 15.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                  visible: isCopied,
                  child: Text(
                    "Copiado",
                    style: TextStyle(color: white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
