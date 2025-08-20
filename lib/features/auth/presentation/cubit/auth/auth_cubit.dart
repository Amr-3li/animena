// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:animena/core/exeption_services/firebase_exeption_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
    emit(RegisterLoading());
    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (!hasConnection) {
      log('No internet connection');
      emit(RegisterError('No internet connection'));
      return;
    }
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseExeptionHandler.handleFirebaseAuthError(e);
      log(errorMessage);
      emit(RegisterError(errorMessage));
    } catch (e) {
      // Handle other types of exceptions
      emit(RegisterError('An error occurred. Please try again.'));
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
