import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStore {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'auth_token';

  Future<void> saveToken(String token) =>
      _storage.write(key: _keyToken, value: token);

  Future<String?> readToken() => _storage.read(key: _keyToken);

  Future<void> clear() => _storage.delete(key: _keyToken);
}
