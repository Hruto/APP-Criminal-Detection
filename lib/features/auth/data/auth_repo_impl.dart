import 'package:anomeye/features/auth/data/auth_api.dart';
import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:anomeye/features/auth/domain/auth_user.dart';
import 'package:anomeye/features/auth/storage/secure_token_store.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApi api;
  final SecureTokenStore store;
  String? _fcm;
  AuthRepoImpl(this.api, this.store);

  @override
  Future<void> signOut() async {
    await store.clear();
  }

  @override
  Future<AuthState> readToken() async {
    final t = await store.read();
    if (t == null) return const AuthState.unauthenticated();
    return AuthState.authenticated(
      token: t,
      user: const AuthUser(
        id: 1,
        email: 'unknown@local',
        companyId: 1,
        role: 'user',
      ),
    );
  }

  @override
  Future<AuthState> signIn({required String email, required String password}) async {
    final (token, user) = await api.signIn(email, password);
    await store.save(token);
    return AuthState.authenticated(token: token, user: user);
  }

  @override
  Future<AuthState> signUp({required String email, required String password, required String companyId}) async {
    final (token, user) = await api.signUp(email: email, password: password, companyId: companyId);
    await store.save(token);
    return AuthState.authenticated(token: token, user: user);
  }

  @override
  Future<void> upsertFcmToken(String token) async {
    _fcm = token;
    await api.upsertFcmToken(token);
  }

  @override
  Future<void> deleteFcmToken() async {
    _fcm = null;
    await api.deleteFcmToken();
  }
}
