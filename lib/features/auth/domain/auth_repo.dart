import 'auth_state.dart';

abstract class AuthRepo {
  Future<AuthState> signIn({required String email, required String password});
  Future<AuthState> signUp(
      {required String email,
      required String password,
      required String companyId});
  Future<AuthState> readToken();
  Future<void> signOut();
}
