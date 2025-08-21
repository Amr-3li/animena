// ignore_for_file: depend_on_referenced_packages

import 'package:animena/features/auth/data/repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.login(email, password);
    result.fold(
      (failure) {
        emit(LoginError(failure.errMessage));
      },
      (success) {
        emit(LoginSuccess());
      },
    );
  }

  Future<void> signup(
      String name, String phone, String email, String password) async {
    emit(RegisterLoading());
    final result = await authRepo.signup(name, email, password, phone);
    result.fold(
      (failure) {
        emit(RegisterError(failure.errMessage));
      },
      (success) {
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await authRepo.logout();
    result.fold(
      (failure) {
        emit(LogoutError(failure.errMessage));
      },
      (success) async {
        emit(LogoutSuccess());
      },
    );
  }
}
