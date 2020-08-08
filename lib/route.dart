import 'package:ayo_bantu/views/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (context) => LoginPage(),
    // nambahin routes darisini
  };

  static Map<String, WidgetBuilder> getAll() => _routes;

}