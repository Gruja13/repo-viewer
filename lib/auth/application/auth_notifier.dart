import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/domain/auth_faliure.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

// Callback function for authorization URL
typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

class AuthNotifier extends StateNotifier<AuthState> {
  final GithubAuthenticator _authenticator;

  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  // Check if the user is signed in
  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSignedIn())
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  // Sign in
  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();

    final redirectUrl = await authorizationCallback(_authenticator.getAuthorizationUrl(grant));

    final failureOrCredentials = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );

    state = failureOrCredentials.fold(
      (failure) => state = AuthState.failure(failure),
      (_) => state = const AuthState.authenticated(),
    );

    grant.close();
  }

  // Sign out
  Future<void> signOut() async {
    final failureOrUnit = await _authenticator.signOut();

    state = failureOrUnit.fold(
      (failure) => AuthState.failure(failure),
      (_) => const AuthState.unauthenticated(),
    );
  }
}
