import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String name;
  String email;
  String phone;
  String id;
  UserData({required this.name, required this.email, required this.phone, required this.id});
  factory UserData.fromDocument(DocumentSnapshot doc) {
    return UserData(
      id: doc.id,
      email: doc['email'],
      name: doc['name'],
      phone: doc['phone'],
      // Initialize other fields here
    );
  }
}