import 'package:anomeye/features/auth/domain/auth_repo.dart';
import 'package:anomeye/features/auth/domain/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifications/fcm.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._repo, this._ref)
      : super(const AuthState.unauthenticated());

  final AuthRepo _repo;
  final Ref _ref;

  Future<void> bootstrap() async {
    state = await _repo.readToken();
  }

  Future<void> signIn(String email, String password) async {
    state = await _repo.signIn(email: email, password: password);
    await _attachFcmIfAny();
  }

  Future<void> signUp(String email, String password, String company) async {
    state = await _repo.signUp(
        email: email, password: password, companyId: company);
    await _attachFcmIfAny();
  }

  Future<void> signOut() async {
    await _repo.deleteFcmToken();
    await _repo.signOut();
    state = const AuthState.unauthenticated();
  }

  Future<void> _attachFcmIfAny() async {
    final t = await ensureFcmToken(_ref);
    if (t == null) return;

    await _repo.upsertFcmToken(t);
    state = state.maybeWhen(
      authenticated: (token, user) => AuthState.authenticated(
          token: token, user: user.copyWith(fcmToken: t)),
      orElse: () => state,
    );
  }
}
