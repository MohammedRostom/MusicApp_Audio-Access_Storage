import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/Colors.dart';
import '../../core/utils/Constant.dart';

class themes {
  static final ThemeData LightMode = ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: App_color.Slider_color,
            onSurface: Colors.white,
            secondary: App_color.Slider_color.withOpacity(0.4),
            onPrimary: Colors.white,
            primaryContainer: const Color.fromARGB(255, 223, 223, 223),
          ),
      primaryColor: App_color.Slider_color,
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: App_color.Slider_color,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: const Color.fromARGB(18, 0, 0, 0),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: App_color.Slider_color),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 24),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(color: App_color.Slider_color, size: 30),
      textTheme: TextTheme(
        labelLarge: TextStyle(
            fontSize: 22,
            color: App_color.Background_btn_color,
            fontFamily: Constans.fontName,
            fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontSize: 20, color: App_color.Slider_color),
        titleMedium: TextStyle(
            fontSize: 15,
            color: App_color.Slider_color,
            textBaseline: TextBaseline.alphabetic),
        titleSmall: TextStyle(fontSize: 13),
      ));

// Darkthemes
  static final ThemeData DarkTheme = ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
          primary: App_color.Slider_color,
          onSurface: Colors.white,
          onPrimary: Colors.white,
          secondary: App_color.Slider_color.withOpacity(0.4),
          primaryContainer: App_color.Background_btn_color.withOpacity(0.5),
          onPrimaryContainer: Colors.white),
      primaryColor: App_color.Background_btn_color,
      scaffoldBackgroundColor: App_color.Primary_color,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: App_color.Background_btn_color,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(color: App_color.Slider_color, fontSize: 24),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: App_color.Slider_color, size: 27),
      ),
      iconTheme: IconThemeData(color: App_color.Slider_color, size: 27),
      textTheme: TextTheme(
        labelLarge: TextStyle(
            fontSize: 22,
            color: App_color.Slider_color,
            fontFamily: Constans.fontName,
            fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontSize: 20, color: Colors.white),
        titleMedium: TextStyle(fontSize: 15, color: App_color.Slider_color),
        titleSmall:
            TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.4)),
      ));
}
