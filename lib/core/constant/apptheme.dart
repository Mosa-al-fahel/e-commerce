import 'package:app/core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData apptheme = ThemeData(

  appBarTheme: const AppBarTheme(
      backgroundColor: Appcolors.appbarcackgroundColor,
      titleTextStyle: TextStyle(
          color: Appcolors.blue,
          fontFamily: "LibreBaskerville",
          fontSize: 22,
          fontWeight: FontWeight.bold),
      centerTitle: true),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Appcolors.backgroundbluetowhite),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "LibreBaskerville",
          color: Appcolors.black,
          fontSize: 33,
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          fontFamily: "HinaMincho",
          color: Color.fromARGB(255, 45, 45, 45),
          fontSize: 31,
          fontWeight: FontWeight.w600
          //fontWeight: FontWeight.w100
          )),
);
