import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_template/utils/languages.dart';
import 'package:getx_template/utils/theme_services.dart';
import 'package:getx_template/views/home_screen.dart';
import 'package:getx_template/views/shopping_page.dart';
import 'utils/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx template',
      translations: Languages(), // your translations
      locale: Locale('bn', 'BD'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomeScreen(),/*MyHomePage(title: 'Flutter Demo Home Page'),*/
    );
  }
}