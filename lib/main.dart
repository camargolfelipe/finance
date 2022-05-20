import 'package:finance/helper/routes.dart';
import 'package:finance/helper/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      initialRoute: '/',
      routes: appRoutes,
      translations: Messages(),
      locale: Locale('pt', 'BR'),
      fallbackLocale: Locale('pt', 'BR'),
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.oswaldTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
