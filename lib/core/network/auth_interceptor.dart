import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/screens/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;
  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final state = ref.read(authStateProvider);
    state.maybeWhen(
      authenticated: (token, _) {
        options.headers['Authorization'] = 'Bearer $token';
      },
      orElse: () {},
    );
    handler.next(options);
  }
}
