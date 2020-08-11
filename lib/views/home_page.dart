import 'package:ayo_bantu/components/drawer/custom_drawer.dart';
import 'package:ayo_bantu/components/home_page/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              Navigator.of(context).pushReplacementNamed('/debug');
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
                ],
              ),
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(FontAwesomeIcons.bars, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.home, color: Colors.white)),
            Tab(icon: Icon(FontAwesomeIcons.bell, color: Colors.white)),
            Tab(icon: Icon(Icons.restore, color: Colors.white)),
          ]),
        ),
        body: TabBarView(children: [
          CustomDrawer(),
          DashBoard(),
          Text('1'),
          Text('1'),
        ]),
      ),
    );
  }
}
