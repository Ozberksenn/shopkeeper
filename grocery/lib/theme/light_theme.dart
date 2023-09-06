import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Color.fromRGBO(245, 131, 93, 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(245, 131, 93, 1)),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0),
    textTheme: TextTheme(
      titleMedium: const TextStyle(
          color: Colors.grey, fontSize: 16, fontFamily: 'PlayfairDisplay'),
      titleSmall: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          fontFamily: 'PlayfairDisplay'),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color.fromRGBO(245, 131, 93, 1),
      secondary: Colors.grey,
      tertiary: Colors.white70,
      onPrimary: Colors.black,
      onSecondary: Colors.grey.shade300,
      primaryContainer: Colors.white,
      secondaryContainer: Colors.white70,
    ).copyWith(background: Colors.white));
