abstract class BlocState {}

class Waiting extends BlocState {}

class Loading extends BlocState {}

class Success extends BlocState {
  var data;
  Success(this.data);
}

class Error extends BlocState {
  var message;
  Error(this.message);
}