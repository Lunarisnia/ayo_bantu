import 'package:ayo_bantu/constant/config.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();
class AuthService {
  login(Map<String,dynamic> credential) async {
    try {
      final Response resp = await dio.post("$API/login", data: credential);

      return resp.data;
    } catch (e) {
      print(e);
      throw Exception("Error: A1");
    }
  }
}