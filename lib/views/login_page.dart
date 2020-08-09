import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/blocs/login_bloc.dart';
import 'package:ayo_bantu/components/login_page/login_form.dart';
import 'package:ayo_bantu/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              } else if (state is Success) {
                if (state.data) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  });
                  return SplashScreen();
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
              return LoginForm();
            },
          ),
        ),
      ),
    );
  }
}
