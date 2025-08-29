import 'package:dio/dio.dart';
import '../domain/auth_user.dart';

class AuthApi {
  final Dio _dio;
  AuthApi(this._dio);

  /// Login: POST /api/login -> { token }
  Future<(String, AuthUser)> signIn(String email, String password) async {
    try {
      final r = await _dio.post(
        '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final token = (r.data is Map) ? (r.data['token'] as String) : null;
      if (token == null || token.isEmpty) {
        throw DioException(
          requestOptions: r.requestOptions,
          response: r,
          error: 'Token is missing in response',
          type: DioExceptionType.badResponse,
        );
      }
      // Backend login response doesn't include user; synthesize minimal user
      final user = AuthUser(
        id: -1,
        email: email,
        companyId: -1,
        role: 'user',
      );
      return (token, user);
    } on DioException catch (e) {
      final msg = _extractErrorMessage(e) ?? 'Failed to login';
      throw Exception(msg);
    }
  }

  /// Register: POST /api/register -> usually no token. Then auto-login.
  Future<(String, AuthUser)> signUp({
    required String email,
    required String password,
    required String companyId,
  }) async {
    try {
      // Try to parse company_id as int, fallback to 1
      final cid = int.tryParse(companyId) ?? 1;
      await _dio.post(
        '/api/register',
        data: {
          'email': email,
          'password': password,
          'company_id': cid,
          // optional role, default to user
          'role': 'company_admin',
        },
      );
      // Most flows require a login after register
      return await signIn(email, password);
    } on DioException catch (e) {
      final msg = _extractErrorMessage(e) ?? 'Failed to register';
      throw Exception(msg);
    }
  }

  String? _extractErrorMessage(DioException e) {
    try {
      final data = e.response?.data;
      if (data is Map && data['message'] is String) return data['message'] as String;
      if (data is Map && data['error'] is String) return data['error'] as String;
    } catch (_) {}
    return null;
  }
}
