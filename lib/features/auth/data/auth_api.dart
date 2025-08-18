import 'package:dio/dio.dart';
import '../domain/auth_user.dart';

class AuthApi {
  final Dio _dio;
  AuthApi(this._dio);

  Future<(String, AuthUser)> signIn(String email, String password) async {
    // TODO: ganti dengan endpoint asli, contoh:
    // final r = await _dio.post('/api/auth/login', data: {'email': email, 'password': password});
    // final token = r.data['token'] as String;
    // final user = AuthUser.fromJson(r.data['user']);
    // return (token, user);

    // SKELETON: kosong (biar compile aman)
    return (
      'DUMMY_TOKEN',
      AuthUser(id: 1, email: email, companyId: 1, role: 'company_admin')
    );
  }

  Future<(String, AuthUser)> signUp({
    required String email,
    required String password,
    required String companyId,
  }) async {
    final r = await _dio.post('/api/auth/register', data: {
      'email': email,
      'password': password,
      'companyId': companyId,
    });
    final token = r.data['token'] as String;
    final user = AuthUser.fromJson(r.data['user']);
    return (token, user);
  }
}
