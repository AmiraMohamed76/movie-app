
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constance.dart';


class DioFactory {
  static Dio create(){
    return Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
