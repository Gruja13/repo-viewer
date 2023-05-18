import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';

class SecureCredentialsStorage implements CredentialsStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureCredentialsStorage(this._flutterSecureStorage);

  static const _key = 'oauth2_credentials';

  Credentials? _cachedCredentials;

  // Read the credentials from the secure storage
  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials != null) {
      return Future.value(_cachedCredentials);
    }
    final json = await _flutterSecureStorage.read(key: _key);

    if (json == null) {
      return null;
    }

    try {
      return _cachedCredentials = Credentials.fromJson(json);
    } on FormatException {
      return null;
    }
  }

  // Save the credentials to the secure storage
  @override
  Future<void> save(Credentials credentials) {
    _cachedCredentials = credentials;
    return _flutterSecureStorage.write(key: _key, value: jsonEncode(credentials.toJson()));
  }

  // Clear the credentials from the secure storage
  @override
  Future<void> clear() {
    _cachedCredentials = null;
    return _flutterSecureStorage.delete(key: _key);
  }
}
