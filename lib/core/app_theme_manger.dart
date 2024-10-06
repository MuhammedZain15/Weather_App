import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeManger {
  static ThemeData Theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),

    ),
    scaffoldBackgroundColor: Colors.black

  );
}
