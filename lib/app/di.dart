import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'env.dart';
import '../core/network/auth_interceptor.dart';

final envProvider = Provider<AppEnv>((_) => defaultEnv);

final dioProvider = Provider<Dio>((ref) {
  final env = ref.watch(envProvider);
  final dio = Dio(BaseOptions(
    baseUrl: env.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 20),
  ));
  dio.interceptors.add(AuthInterceptor(ref)); // no-op dulu
  return dio;
});
