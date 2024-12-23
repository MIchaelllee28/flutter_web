import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_template/config/language/languages.dart';
import 'package:getx_template/config/pages/main_page.dart';
import 'package:getx_template/config/routes/main_route.dart';
import 'package:getx_template/config/theme/theme_services.dart';
import 'config/language/language_services.dart';
import 'config/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      translations: Languages(), // your translations
      locale: LanguageService()
          .locale, // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      defaultTransition: Transition.fadeIn,
      themeMode: ThemeService().theme,
      enableLog: false,
      getPages: MainPage.main,
      initialRoute: MainRoute.home,
    );
  }
}
