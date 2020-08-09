import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  final Function validator;
  LoginFields({@required this.validator});

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: widget.validator,
              decoration: InputDecoration(
                  fillColor: Colors.red,
                  focusColor: Colors.red,
                  labelText: "Email",
                  prefixIcon: Icon(Icons.supervised_user_circle)),
            ),
            TextFormField(
              validator: widget.validator,
              obscureText: _isHidden,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
