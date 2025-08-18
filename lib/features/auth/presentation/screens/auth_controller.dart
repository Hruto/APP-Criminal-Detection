import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthRepo _repo;
  AuthController(this._repo) : super(const AuthState.unauthenticated()) {
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    state = await _repo.readToken();
  }

  Future<void> signIn(String email, String password) async {
    state = await _repo.signIn(email: email, password: password);
  }

  Future<void> signUp(String email, String password, String companyId) async {
    state = await _repo.signUp(
        email: email, password: password, companyId: companyId);
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = const AuthState.unauthenticated();
  }
}
