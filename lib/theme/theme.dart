import 'package:flutter/material.dart';
import 'package:invoice_web/theme/colors.dart';

var lightThemeData = ThemeData(
  primaryColor: AppColor.primaryColor,
  colorScheme: ColorScheme(
    primary: AppColor.primaryColor,
    error: AppColor.red,
    secondary: AppColor.secondaryColor,
    onSecondary: AppColor.onSecondaryColor,
    onPrimary: AppColor.onPrimary,
    onBackground: AppColor.white,
    surface: AppColor.white,
    onSurface: AppColor.black,
    background: AppColor.white,
    brightness: Brightness.light,
    onError: AppColor.red,
  ),
  bottomAppBarColor: AppColor.white,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,

  )
);

var darkThemeData = ThemeData(
  primaryColor: AppColor.secondaryColor,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: const TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: const TextStyle(
      color: Colors.white70,
    ),
  ),
  bottomAppBarColor: AppColor.black,
  colorScheme: ColorScheme(
    primary: AppColor.primaryColor,
    error: AppColor.red,
    secondary: AppColor.secondaryColor,
    onSecondary: AppColor.onSecondaryColor,
    onPrimary: AppColor.onPrimary,
    onBackground: AppColor.white,
    surface: AppColor.white,
    onSurface: AppColor.black,
    background: AppColor.white,
    brightness: Brightness.light,
    onError: AppColor.red,
  ),
);
