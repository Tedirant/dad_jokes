import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 30,
  ),
);
