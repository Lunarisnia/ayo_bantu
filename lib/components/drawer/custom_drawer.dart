import 'package:ayo_bantu/constant/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/profile_BG.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: height * 0.03),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Image(
                  image: AssetImage(
                    'assets/images/blank-profile.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'John Doe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Montserrat',
            ),
          ),
          Text(
            'level 20 Active Donator',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 15.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Color.fromRGBO(218, 235, 199, 1),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.solidGrinBeam,
                      color: Color.fromRGBO(49, 82, 91, 0.8),
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 82, 91, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 15.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Color.fromRGBO(218, 235, 199, 1),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.levelUpAlt,
                      color: Color.fromRGBO(49, 82, 91, 0.8),
                    ),
                    title: Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 82, 91, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 15.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Color.fromRGBO(218, 235, 199, 1),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.tools,
                      color: Color.fromRGBO(49, 82, 91, 0.8),
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 82, 91, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 15.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Color.fromRGBO(218, 235, 199, 1),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Color.fromRGBO(49, 82, 91, 0.8),
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 82, 91, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
