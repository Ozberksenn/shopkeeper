import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade300,
      selectedItemColor: const Color.fromRGBO(204, 172, 109, 1),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color.fromRGBO(204, 172, 109, 1),
        fontSize: 24,
        fontFamily: 'PlayfairDisplay',
        letterSpacing: 3,
      ),
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleMedium: const TextStyle(
          color: Colors.grey, fontSize: 16, fontFamily: 'PlayfairDisplay'),
      titleSmall: const TextStyle(
        // color:Color.fromRGBO(204, 172, 109, 1) ,
        fontSize: 18,
        letterSpacing: 2,
        fontFamily: 'PlayfairDisplay',
      ),
      displayLarge: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w400,
          fontFamily: 'PlayfairDisplay'),
      titleLarge: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: 'PlayfairDisplay'),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color.fromRGBO(204, 172, 109, 1),
      secondary: Colors.grey,
      tertiary: Colors.white70,
      onPrimary: Colors.black,
      onSecondary: Colors.grey.shade300,
      primaryContainer: Colors.white,
      secondaryContainer: Colors.white70,
    ).copyWith(background: Colors.white));
