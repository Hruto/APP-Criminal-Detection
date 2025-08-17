import 'auth_state.dart';

abstract class AuthRepo {
  Future<AuthState> signIn({required String email, required String password});
  Future<void> signOut();
  Future<AuthState> restore(); // baca token dari storage
  Future<AuthState> signUp(
      {required String email,
      required String password,
      required String companyName});
}
