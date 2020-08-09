import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/blocs/login_bloc.dart';
import 'package:ayo_bantu/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePassword = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(Waiting()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<LoginBloc, BlocState>(
          builder: (context, state) {
            if (state is Success) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pushReplacementNamed('/home');
              });
              return SplashScreen();
            } else if (state is Error) {
              print(state.message);
            } else if (state is Waiting) {
              return Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/login-background.png',
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Image.asset("assets/images/logo.png"),
                  Positioned(
                    top: 25,
                    left: 0,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: height * 0.27),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field cannot be empty";
                                        }
                                        return null;
                                      },
                                      controller: fullNameController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.red,
                                        focusColor: Colors.red,
                                        labelText: "Full Name",
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field cannot be empty";
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          fillColor: Colors.red,
                                          focusColor: Colors.red,
                                          labelText: "Email",
                                          prefixIcon: Icon(
                                              Icons.supervised_user_circle)),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "This field cannot be empty";
                                        }
                                        return null;
                                      },
                                      controller: passwordController,
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
                                    TextFormField(
                                      controller: retypePassword,
                                      validator: (value) {
                                        if (value.isEmpty &&
                                            passwordController.text.isEmpty) {
                                          return "This field cannot be empty";
                                        } else if (value !=
                                            passwordController.text) {
                                          return "password didn't match";
                                        }
                                        return null;
                                      },
                                      obscureText: _isHidden,
                                      decoration: InputDecoration(
                                        labelText: "Retype Password",
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: _toggleVisibility,
                                          icon: _isHidden
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Container(
                                        height: 50.0,
                                        child: FlatButton(
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(
                                                Register({
                                                  "fullname":
                                                      fullNameController.text,
                                                  "email": emailController.text,
                                                  'password':
                                                      passwordController.text
                                                }),
                                              );
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80.0)),
                                          padding: EdgeInsets.all(0.0),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromRGBO(
                                                        85, 190, 186, 1),
                                                    Color.fromRGBO(
                                                        218, 235, 199, 1)
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 200.0,
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "SIGN UP",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
