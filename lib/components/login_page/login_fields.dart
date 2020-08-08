import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  final Function validator;
  LoginFields({@required this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: validator,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "yourEmail@email.com"
            ),
          ),
          TextFormField(
            validator: validator,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
        ],
      ),
    );
  }
}
