import 'package:ayo_bantu/blocs/bloc_event.dart';
import 'package:ayo_bantu/blocs/bloc_state.dart';
import 'package:ayo_bantu/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AuthService authService = AuthService();
class LoginBloc extends Bloc<BlocEvent, BlocState> {
  LoginBloc(BlocState initialState) : super(initialState);

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is Login) {
      yield Loading();
      try {
        final resp = await authService.login(event.credential);

        yield Success(resp);
      } catch (e) {
        yield Error(e);
      }
    } else if (event is AuthCheck) {
      yield Loading();
      try {
        final resp = await authService.tokenCheck();

        yield Success(resp);
      } catch (e) {
        yield Error(e);
      }
    }
  }
}
