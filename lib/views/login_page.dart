import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/blocs/login_bloc.dart';
import 'package:ayo_bantu/components/login_page/login_button.dart';
import 'package:ayo_bantu/components/login_page/login_fields.dart';
import 'package:ayo_bantu/views/home_page.dart';
import 'package:ayo_bantu/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static const tag = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(Waiting()),
      child: Container(
        child: Center(
          child: BlocBuilder<LoginBloc, BlocState>(
            builder: (context, state) {
              if (state is Waiting) {
                BlocProvider.of<LoginBloc>(context).add(AuthCheck());
                // return SplashScreen();
              } else if (state is Success) {
                print(state.data);
                if (state.data) {
                  //redirect to home
                  return HomePage();
                }
              } else if (state is Error) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                });
              } else if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/login-background.png',
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LoginFields(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "This field can't be empty";
                              }
                              return null;
                            },
                          ),
                          LoginButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                return Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Login-in"),
                                ));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
