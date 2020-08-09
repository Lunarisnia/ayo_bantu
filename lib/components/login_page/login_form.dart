import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/login_bloc.dart';
import 'package:ayo_bantu/components/login_page/facebook_button.dart';
import 'package:ayo_bantu/components/login_page/google_button.dart';
import 'package:ayo_bantu/components/login_page/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_fields.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              LoginFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              LoginButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<LoginBloc>(context).add(
                      Login({
                        "email": emailController.text,
                        "password": passwordController.text
                      }),
                    );
                  }
                },
              ),
              SizedBox(height: height * 0.14),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GoogleButton(),
                    FacebookButton()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(width: 5),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            decoration: TextDecoration.underline),
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
