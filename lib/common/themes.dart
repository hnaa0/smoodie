import 'package:flutter/material.dart';

abstract class SmoodieTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Pretendard",
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      splashFactory: NoSplash.splashFactory,
    ),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Pretendard",
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
