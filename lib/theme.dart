import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData.dark().copyWith(
    iconTheme: const IconThemeData(
      size: 22,
      color: Colors.grey,
    ),
  );
}
