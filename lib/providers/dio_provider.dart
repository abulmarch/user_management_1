import 'package:dio/dio.dart';

final dioProvider = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10)
  )
)..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));