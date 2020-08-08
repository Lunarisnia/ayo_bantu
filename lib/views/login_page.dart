import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/blocs/login_bloc.dart';
import 'package:ayo_bantu/views/home_page.dart';
import 'package:ayo_bantu/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static const tag = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatelessWidget {
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
                return SplashScreen();
              }
              if (state is Success) {
                print(state.data);
                return HomePage();
              } else if (state is Error) {
                print(state.message);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => {
                      BlocProvider.of<LoginBloc>(context).add(
                        Login({"email": "rio@mail.com", "password": "1234"}),
                      ),
                    },
                    child: Text("Login"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
