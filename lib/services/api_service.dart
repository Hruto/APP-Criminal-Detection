import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<Response<T>> get<T>(String url, {Map<String, dynamic>? query}) {
    return _dio.get<T>(url, queryParameters: query);
  }

  // Add POST/PUT/DELETE as needed
}
