abstract class BlocEvent {}

class Login extends BlocEvent {
  Map<String, dynamic> credential;
  Login(this.credential);
}

class AuthCheck extends BlocEvent {}

class Logout extends BlocEvent {}

class Register extends BlocEvent {
  final Map<String,dynamic> newUserData;
  Register(this.newUserData);
}
