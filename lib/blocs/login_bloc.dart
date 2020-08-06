import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<BlocEvent, BlocState> {
  LoginBloc(BlocState initialState) : super(initialState);
  // BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is Login) {
      yield Loading();
      try {
        AuthService authService = AuthService();
        final resp = await authService.login(event.credential);

        yield Success(resp);
      } catch (e) {
        yield Error(e.message);
      }
    }
  }
}
