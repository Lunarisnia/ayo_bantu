abstract class BlocEvent {}

class Login extends BlocEvent {
  Map<String, dynamic> credential;
  Login(this.credential);
}

class AuthCheck extends BlocEvent {}
