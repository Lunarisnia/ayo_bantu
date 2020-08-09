import 'package:ayo_bantu/constant/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {

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

  void loginWithEmailandPassword(String email, String password) {
    String userEmail = email;
    String userPassword = password;

    Dio.post(loginApi, data: {"email": userEmail, "password": userPassword});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController;
    TextEditingController passwordController;
    return Column(
      children: <Widget>[
        Padding(
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
                  controller: emailController,
                  validator: (value){
                    value = emailController.text;
                    if (value.isEmpty) {
                      return 'this field cannot be empty';
                    }
                    return value;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.red,
                      focusColor: Colors.red,
                      labelText: "Email",
                      prefixIcon: Icon(Icons.supervised_user_circle)),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (val){
                    val = passwordController.text;
                    if (val.isEmpty) {
                      return 'this field cannot be empty';
                    }
                    return val;
                  },
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
        ),
        Container(
      height: 50.0,
      child: FlatButton(
        onPressed: (){
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(85,190,186, 1), Color.fromRGBO(218,235,199, 1)],
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
    ),
      ],
    );
  }
}
