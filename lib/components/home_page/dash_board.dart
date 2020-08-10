import 'package:ayo_bantu/components/home_page/post_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(85, 190, 186, 1),
        onPressed: () {
          print("Create post page");
        },
        child: Icon(
          FontAwesomeIcons.pencilAlt,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return PostCard();
        },
      ),
    );
  }
}
