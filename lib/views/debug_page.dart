import 'package:ayo_bantu/constant/config.dart';
import 'package:ayo_bantu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  try {
                    final user = await dio.post(currentUser);

                    print(user.data.toString());
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Show Active User"),
              ),
              RaisedButton(
                onPressed: () async {
                  final storage = FlutterSecureStorage();
                  await storage.delete(key: 'token');
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
