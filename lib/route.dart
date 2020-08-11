import 'package:ayo_bantu/views/login_page.dart';
import 'package:ayo_bantu/views/register_page.dart';
import 'package:ayo_bantu/views/leaderboard_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (context) => LoginPage(),
    "/register": (context) => RegisterPage(),
    "/leader": (context) => LeaderboardPage(),
    // nambahin routes darisini
  };

  static Map<String, WidgetBuilder> getAll() => _routes;

}

class RouteList {

}