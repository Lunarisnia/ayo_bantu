import 'package:ayo_bantu/components/home_page/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> pages = <Widget>[
    Center(
      child: Text("OKE"),
    ),
    DashBoard(),
    Center(
      child: Text("44"),
    ),
    Center(
      child: Text("AAAAAAAAA"),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                ])),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.bars, color: Colors.white)),
              Tab(icon: Icon(FontAwesomeIcons.home, color: Colors.white)),
              Tab(icon: Icon(FontAwesomeIcons.bell, color: Colors.white)),
              Tab(icon: Icon(Icons.restore, color: Colors.white)),
            ],
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: pages,
        ),
      ),
    );
  }
}