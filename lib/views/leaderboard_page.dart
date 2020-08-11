import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.pop(context),
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
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text(1.toString()),
              title: Text('John Doe'),
              subtitle: Text('level 20 Active Donator'),
              trailing: Icon(FontAwesomeIcons.crown),
            )
          ],
        ),
      ),
    );
  }
}
