import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.red,
      child: Icon(
        FontAwesomeIcons.google,
        size: 25.0,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
