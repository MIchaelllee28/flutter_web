import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  // Color constants
  static const Color scaffoldBg = Color(0xff252734);
  static const Color bgLight1 = Color(0xffFE333646);
  static const Color bgLight2 = Color(0xff424657);
  static const Color textFieldBg = Color(0xffC8C9CE);

  static const Color hintDark = Color(0xff666876);
  static const Color yellowSecondary = Color(0xffFFC25C);
  static const Color yellowPrimary = Color(0xffFFAF29);
  static const Color whitePrimary = Color(0xffEAEAEB);
  static const Color whiteSecondary = Color(0xffC8C9CE);

  static const Color shadowColorLight = Colors.black12;
  static const Color shadowColorDark = Colors.white12;

  static const MaterialColor primarySwatchLight = MaterialColor(
    0xff3E4685,
    <int, Color>{
      50: Color(0xff3E4685),
      100: Color(0xff3E4685),
      200: Color(0xff3E4685),
      300: Color(0xff3E4685),
      400: Color(0xff3E4685),
      500: Color(0xff3E4685),
      600: Color(0xff3E4685),
      700: Color(0xff3E4685),
      800: Color(0xff3E4685),
      900: Color(0xff3E4685),
    },
  );

  static const MaterialColor primarySwatchDark = MaterialColor(
    0xffFE752F,
    <int, Color>{
      50: Color(0xffFE752F),
      100: Color(0xffFE752F),
      200: Color(0xffFE752F),
      300: Color(0xffFE752F),
      400: Color(0xffFE752F),
      500: Color(0xffFE752F),
      600: Color(0xffFE752F),
      700: Color(0xffFE752F),
      800: Color(0xffFE752F),
      900: Color(0xffFE752F),
    },
  );

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primarySwatchLight,
      secondary: yellowSecondary,
      surface: bgLight1,
    ),
    scaffoldBackgroundColor: scaffoldBg,
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: shadowColorLight,
      iconTheme: IconThemeData(color: whiteSecondary),
      backgroundColor: bgLight1,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: whitePrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: bgLight1,
      indicatorColor: primarySwatchLight.withOpacity(0.2),
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: whitePrimary,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: bgLight2,
      elevation: 2,
      shadowColor: shadowColorLight,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: bgLight2,
      elevation: 8,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgLight2,
      modalBackgroundColor: bgLight2,
      elevation: 8,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primarySwatchDark,
      secondary: yellowPrimary,
      surface: scaffoldBg,
    ),
    scaffoldBackgroundColor: scaffoldBg,
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: shadowColorDark,
      iconTheme: IconThemeData(color: whiteSecondary),
      backgroundColor: scaffoldBg,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: whitePrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: scaffoldBg,
      indicatorColor: primarySwatchDark.shade200,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: whitePrimary,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: bgLight1,
      elevation: 2,
      shadowColor: shadowColorDark,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: bgLight1,
      elevation: 8,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgLight1,
      modalBackgroundColor: bgLight1,
      elevation: 8,
    ),
  );
}
