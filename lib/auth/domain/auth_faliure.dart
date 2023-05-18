import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_faliure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.server([String? message]) = Server;
  const factory AuthFailure.storage() = Storage;
}
