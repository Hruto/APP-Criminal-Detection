import 'package:anomeye/features/auth/data/auth_api.dart';
import 'package:anomeye/features/auth/data/auth_repo_impl.dart';
import '../../storage/secure_token_store.dart';
import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/di.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepoImpl(AuthApi(dio), SecureTokenStore());
});

final authStateProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.watch(authRepoProvider))..restore();
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepo _repo;
  AuthController(this._repo) : super(const AuthState.unauthenticated());

  Future<void> restore() async {
    state = await _repo.restore();
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = const AuthState.unauthenticated();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthState.unauthenticated();
    state = await _repo.signIn(email: email, password: password);
  }

  Future<void> signUp(
    String email,
    String password,
    String companyName,
  ) async {
    state = await _repo.signUp(
      email: email,
      password: password,
      companyName: 'companyName',
    );
  }
}
