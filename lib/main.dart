import 'package:ayo_bantu/blocs/bloc_observer.dart';
import 'package:ayo_bantu/views/debug_page.dart';
import 'package:ayo_bantu/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/login_page.dart';
import 'views/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayo Bantu',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (_) => HomePage(),
        "/register": (context) => RegisterPage(),
        '/debug': (_) => DebugPage(),
      },
    );
  }
}
