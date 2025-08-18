import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:anomeye/features/auth/domain/auth_user.dart';
import 'package:anomeye/features/auth/storage/secure_token_store.dart';

class AuthRepoFake implements AuthRepo {
  final SecureTokenStore _store;
  AuthRepoFake(this._store);

  @override
  Future<AuthState> signIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (email.isEmpty || password.length < 3) {
      throw Exception('Invalid credential');
    }
    final token = 'fake-${DateTime.now().millisecondsSinceEpoch}';
    await _store.save(token);
    final user = AuthUser(id: 1, email: email, companyId: 1, role: 'user');

    return AuthState.authenticated(token: token, user: user);
  }

  @override
  Future<AuthState> signUp({
    required String email,
    required String password,
    required String companyId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final token = 'signup-${DateTime.now().millisecondsSinceEpoch}';
    await _store.save(token);
    final user = AuthUser(id: 1, email: email, companyId: 1, role: 'user');

    return AuthState.authenticated(token: token, user: user);
  }

  @override
  Future<AuthState> readToken() async {
    final t = await _store.read();
    if (t == null) return const AuthState.unauthenticated();
    final user =
        AuthUser(id: 1, email: 'demo@example.com', companyId: 1, role: 'user');
    return AuthState.authenticated(token: t, user: user);
  }

  @override
  Future<void> signOut() async => _store.clear();
}
