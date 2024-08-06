part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//login States ===================================================
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String error;

  LoginError(this.error);
}

// register States ==============================================
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String error;

  RegisterError(this.error);
}
// logout States =================================================

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutError extends AuthState {
  final String error;

  LogoutError(this.error);
}