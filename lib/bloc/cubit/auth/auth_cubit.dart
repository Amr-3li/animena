// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sharedPreferences.setString('email', email);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> signup(
      String name, String phone, String email, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sharedPreferences.setString('email', email);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    emit(LogoutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      sharedPreferences.remove('email');
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
