import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            final storage = FlutterSecureStorage();
            await storage.delete(key: 'token');
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
