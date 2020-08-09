import 'package:ayo_bantu/constant/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Dio dio = Dio();
final FlutterSecureStorage storage = FlutterSecureStorage();

class AuthService {
  login(Map<String, dynamic> credential) async {
    try {
      final Response resp = await Dio().post(loginApi, data: credential);

      await storage.write(key: "token", value: resp.data['token']);
      dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options) async {
          final customHeaders = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${resp.data['token']}',
          };
          options.headers.addAll(customHeaders);
          return options;
        }),
      );
      return true;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw Exception("Invalid email/password.");
      } else {
        print(e);
        throw Exception("Error: A1");
      }
    }
  }

  tokenCheck() async {
    try {
      final String token = await storage.read(key: 'token');

      if (token != null) {
        final Response result =
            await Dio().post(checkToken, data: {"token": token});
        if (result.data['status'] == 1) {
          dio.interceptors.add(
            InterceptorsWrapper(onRequest: (RequestOptions options) async {
              final customHeaders = {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              };
              options.headers.addAll(customHeaders);
              return options;
            }),
          );
          return true;
        }
        await this.logout();
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception("Error: A2");
    }
  }

  logout() async {
    try {
      final resp = await storage.delete(key: 'token');

      return resp;
    } catch (e) {
      print(e);
      throw Exception("Error: A3");
    }
  }

  Future<bool> register(Map<String, dynamic> newUserData) async {
    try {
      final resp = await Dio().post(registerApi, data: newUserData);

      await storage.write(key: 'token', value: resp.data['token']);
      final authenticated = await this.tokenCheck();

      return authenticated;
    } catch (e) {
      print(e);
      throw Exception("Error: A4");
    }
  }

  Future<bool> isSignedIn() async {
    final String token = await storage.read(key: 'token');
    return token != null;
  }
}
