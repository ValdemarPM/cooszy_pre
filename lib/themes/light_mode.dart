import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Baloo2",
  colorScheme: ColorScheme.light(
    background: Colors.white,
    //primary: Colors.grey.shade500,
    //primary: const Color.fromARGB(255, 160, 0, 80),
    //primary: const Color.fromARGB(255, 0, 110, 240),
    primary: const Color.fromARGB(255, 255, 98, 20),
    secondary: const Color.fromARGB(255, 122, 100, 86),
    tertiary: Colors.grey.shade200,
    //inversePrimary: Colors.grey.shade700,
    //inversePrimary: const Color.fromARGB(255, 0, 50, 100),
    inversePrimary: const Color.fromARGB(255, 51, 12, 2),
    onInverseSurface: const Color.fromARGB(150, 51, 12, 2),
    onPrimaryContainer: const Color.fromARGB(150, 255, 98, 20),
    onTertiaryContainer: const Color.fromARGB(255, 255, 246, 242),
  ),
);
