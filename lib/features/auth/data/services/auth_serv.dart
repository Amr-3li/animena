import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServ {
  Future<void> signup(String name, String email, String password, String phone);
  Future<void> login(String email, String password);
  Future<void> logout();
}
