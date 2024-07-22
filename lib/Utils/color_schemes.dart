import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(255, 186, 38, 1),
).copyWith(
  brightness: Brightness.dark,
  primary: const Color.fromRGBO(255, 186, 38, 1),
);

const darkScheme = ColorScheme.dark(
  primary: Colors.black,
  onPrimary: Color.fromRGBO(255, 255, 255, 20),
  outline: Color.fromRGBO(51, 51, 51, 1),
  surface: Color(0xFFDB8C09),
  secondaryContainer: Color.fromRGBO(2, 32, 20, 1),
  onSecondaryContainer: Color.fromRGBO(3, 152, 85, 1),
  errorContainer: Color.fromRGBO(44, 7, 11, 1),
  onErrorContainer: Color.fromRGBO(219, 36, 56, 1),
  onPrimaryContainer: Color.fromARGB(255, 77, 75, 75),
  primaryContainer: Color.fromARGB(1, 23, 22, 22),
  onSurface: Colors.white,
);

const lightScheme = ColorScheme.light(
  primary: Colors.white,
  onPrimary: Colors.black,
  surface: Color.fromRGBO(255, 186, 38, 1),
);
