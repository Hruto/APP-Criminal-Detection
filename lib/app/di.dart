import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:anomeye/features/auth/presentation/screens/auth_controller.dart';
import 'package:anomeye/features/auth/storage/secure_token_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'env.dart';
import '../core/network/auth_interceptor.dart';
import '../features//auth/domain/auth_repo_fake.dart';

final envProvider = Provider<AppEnv>((_) => defaultEnv);

final tokenStoreProvider =
    Provider<SecureTokenStore>((_) => SecureTokenStore());

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepoFake(ref.read(tokenStoreProvider));
});

final authStateProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.read(authRepoProvider));
});

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
