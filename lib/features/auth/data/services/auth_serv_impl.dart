import 'package:animena/core/exeption_services/firebase_exeption_handler.dart';
import 'package:animena/core/services/sharedpreference_singelton.dart';
import 'package:animena/features/auth/data/services/auth_serv.dart';
import 'package:animena/features/profile/data/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServImpl implements AuthServ {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      SharedPreferenceSingelton.setString(
          'userId', firebaseAuth.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseExeptionHandler.handleFirebaseAuthError(e);
      throw Exception(errorMessage);
    } catch (e) {
      // Handle other types of exceptions
      throw Exception('An error occurred while logging in. Please try again.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      SharedPreferenceSingelton.remove('userId');
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseExeptionHandler.handleFirebaseAuthError(e);
      throw Exception(errorMessage);
    } catch (e) {
      // Handle other types of exceptions
      throw Exception('An error occurred while logging out. Please try again.');
    }
  }

  @override
  Future<void> signup(
      String name, String email, String password, String phone) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'userId': userCredential.user!.uid,
      });
    } on FirebaseAuthException catch (e) {
      throw FirebaseExeptionHandler.handleFirebaseAuthError(e);
    } catch (e) {
      // Handle other types of exceptions
      throw Exception('An error occurred. Please try again.');
    }
  }
}
