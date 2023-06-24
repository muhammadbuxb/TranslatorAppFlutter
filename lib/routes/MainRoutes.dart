import 'package:flutter/material.dart';
import 'package:translate_app/pages/home.dart';

class MainRoutes {
  Map<String, Widget Function(BuildContext)> Routes = {
    '/':(context) => const HomePage(),

  };
}
