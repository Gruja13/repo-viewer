import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/domain/auth_faliure.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer/auth/infrastructure/github_oauth_http_client.dart';
import 'package:repo_viewer/core/shared/encoders.dart';

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;
  final Dio _dio;

  GithubAuthenticator(this._credentialsStorage, this._dio);

  // Client ID and Secret
  static const clientId = '0460c0f8d1680b71d4f2';
  static const clientSecret = 'b20a78f703c860cc9b40c781a81fdb59befd59d3';

  // List of scopes
  static const scopes = ['repo', 'user'];

  // Endpoints
  static final authorizationEndpoint = Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint = Uri.parse('https://github.com/login/oauth/access_token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

  // Revocation endpoint
  static final revocationEndpoint = Uri.parse(
    'https://api.github.com/applications/$clientId/token',
  );

  // Get the signed credentials
  Future<Credentials?> getSignedCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          // TODO: Refresh the credentials
        }
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  // Check if the user is signed in
  Future<bool> isSignedIn() => getSignedCredentials().then((credentials) => credentials != null);

  // Sign in
  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

  // Get the authorization URL
  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  // Handle the authorization response
  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      await _credentialsStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server('Invalid code verifier'));
    } on AuthorizationException catch (error) {
      return left(AuthFailure.server(error.description));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  // Sign out
  Future<Either<AuthFailure, Unit>> signOut() async {
    final accessToken = await _credentialsStorage.read().then(
          (credentials) => credentials?.accessToken,
        );

    final usernameAndPassword = stringToBase64.encode('$clientId:$clientSecret');

    try {
      try {
        _dio.deleteUri(
          revocationEndpoint,
          data: {'access_token': accessToken},
          options: Options(
            headers: {'Authorization': 'basic $usernameAndPassword'},
          ),
        );
      } on DioError catch (error) {
        if (error.type == DioErrorType.unknown && error.type is SocketException) {
          // Do nothing
        } else {
          rethrow;
        }
      }

      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
