import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onPressed;
  LoginButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: FlatButton(
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(85, 190, 186, 1),
                  Color.fromRGBO(218, 235, 199, 1)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "SIGN IN",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
