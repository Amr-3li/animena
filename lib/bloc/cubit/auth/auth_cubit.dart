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
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store email in SharedPreferences
      await sharedPreferences.setString('email', email);

      // Emit success state
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      // Handle different FirebaseAuth exceptions
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }

      print(errorMessage);
      emit(RegisterError(errorMessage));
    } catch (e) {
      // Handle other types of exceptions
      print(e.toString());
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
