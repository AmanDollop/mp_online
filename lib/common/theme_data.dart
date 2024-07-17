
import 'package:flutter/material.dart';

class MThemeData {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'FontBold',
      // primarySwatch:  Colors.lightBlue,
      primaryColor: const Color(0xff305673),
      secondaryHeaderColor:const Color(0xff305673),
      hintColor:const Color(0xFF9D9D9D),
      focusColor:const Color(0xFF222222), // TextColor
      hoverColor:const Color(0xFF6C6C6C), // labelColor
      highlightColor: const Color(0xff305673), // primary3Color
      unselectedWidgetColor: const Color(0xff305673), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(background: const Color(0xffFFFFFF)), // primary3Color
    );
  }
}

