import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Baloo2",
  colorScheme: ColorScheme.light(
    background: Colors.white,
    //primary: Colors.grey.shade500,
    //primary: const Color.fromARGB(255, 160, 0, 80),
    primary: const Color.fromARGB(255, 0, 110, 240),
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey.shade100,
    //inversePrimary: Colors.grey.shade700,
    inversePrimary: const Color.fromARGB(255, 0, 50, 100),
    onInverseSurface: const Color.fromARGB(125, 0, 50, 100),
  ),
);
