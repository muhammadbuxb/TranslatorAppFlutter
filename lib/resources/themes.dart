import 'package:flutter/material.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white60,
      iconTheme: IconThemeData(color: Colors.black26)
    )
  );
  ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.black45,
      iconTheme: IconThemeData(color: Colors.white54)
    )
  );
}
