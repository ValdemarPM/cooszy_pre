import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Baloo2",
  dividerColor: Colors.grey.shade200,
  colorScheme: ColorScheme.light(
    surface: Colors.white,

    primary: const Color.fromARGB(255, 255, 98, 20),
    // medium brown
    secondary: const Color.fromARGB(255, 122, 100, 86),
    // lighter gray
    tertiary: Colors.grey.shade200,
    // darker brown
    inversePrimary: const Color.fromARGB(255, 51, 12, 2),
    // light brown
    onInverseSurface: const Color.fromARGB(100, 51, 12, 2),
    // light orange
    onPrimaryContainer: const Color.fromARGB(255, 255, 160, 100),
    //onPrimaryContainer: const Color.fromARGB(255, 233, 163, 117),
    //onPrimaryContainer: const Color.fromARGB(150, 255, 98, 20),
    // lighter orange
    onTertiaryContainer: const Color.fromARGB(255, 255, 246, 242),

    // OLD
    // Turquoise
    // const Color.fromARGB(150, 48, 213, 200),
    //primary: Colors.grey.shade500,
    //primary: const Color.fromARGB(255, 160, 0, 80),
    //primary: const Color.fromARGB(255, 0, 110, 240),
    //inversePrimary: Colors.grey.shade700,
    //inversePrimary: const Color.fromARGB(255, 0, 50, 100),
  ),
);
