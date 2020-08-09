import 'package:ayo_bantu/components/login_page/facebook_button.dart';
import 'package:ayo_bantu/components/login_page/google_button.dart';
import 'package:flutter/material.dart';
import 'login_fields.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/login-background.png',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.01,
            ),
            Image.asset("assets/images/logo.png"),
          ],
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * 0.3),
              LoginFields(),
              // LoginButton(
              //   onPressed: () {
              //     if (_formKey.currentState.validate()) {
              //       return Scaffold.of(context).showSnackBar(SnackBar(
              //         content: Text("Login-in"),
              //       ));
              //     }
              //     return Container();
              //   },
              // ),
              SizedBox(height: height * 0.18),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GoogleButton(),
                    FacebookButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account?'),
                    SizedBox(width: 5),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                          decoration: TextDecoration.underline
                        ),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/register"),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
