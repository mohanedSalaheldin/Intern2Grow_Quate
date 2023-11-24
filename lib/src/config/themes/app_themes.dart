import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';

class AppThemes {
  static final ThemeData appDefaultTheme = ThemeData(
    primaryColor: AppColors.defaultColor,
    scaffoldBackgroundColor: HexColor('#5D13E7'),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('#5D13E7'),
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 30.0,
      ),
      actionsIconTheme: const IconThemeData(),
      elevation: 0.0,
      color: HexColor('#5D13E7'),
      titleTextStyle: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
      ),
    ),
    fontFamily: 'GemunuLibre',
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
        color: Color.fromRGBO(50, 50, 50, .7),
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: HexColor('#FBFBFB'),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
