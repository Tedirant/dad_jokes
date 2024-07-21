import 'package:dio/dio.dart';

class DioSettings {
  final Dio dio;

  DioSettings()
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://icanhasdadjoke.com/",
            connectTimeout: const Duration(milliseconds: 1000),
            sendTimeout: const Duration(milliseconds: 1000),
            receiveTimeout: const Duration(milliseconds: 1000),
          ),
        );
}
