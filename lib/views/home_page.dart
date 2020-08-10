import 'package:ayo_bantu/constant/config.dart';
import 'package:ayo_bantu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              final storage = FlutterSecureStorage();
              await storage.delete(key: 'token');
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo-smaller.png',
            fit: BoxFit.cover,
            height: 60,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                  Color.fromRGBO(85, 190, 186, 1),
                  Color.fromRGBO(218, 235, 199, 1)
                ])),
          ),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(FontAwesomeIcons.bars, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.home, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.bell, color: Colors.white)),
            Tab(icon: Icon(Icons.restore, color: Colors.white)),
          ]),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Image.asset('assets/images/logo-smaller.png'),
          ),
        ),
      ),
    );
  }
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RaisedButton(
//               onPressed: () async {
//                 try {
//                   final user = await dio.post(currentUser);

//                   print(user.data.toString());
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: Text("Show Active User"),
//             ),
//             RaisedButton(
//               onPressed: () async {
//                 final storage = FlutterSecureStorage();
//                 await storage.delete(key: 'token');
//                 Navigator.of(context).pushReplacementNamed('/');
//               },
//               child: Text("Logout"),
//             ),
//           ],
//         ),
//       ),
