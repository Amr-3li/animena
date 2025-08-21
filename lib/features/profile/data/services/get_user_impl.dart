import 'package:animena/features/profile/data/model/user.dart';
import 'package:animena/features/profile/data/services/get_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserImpl implements GetUser {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<UserData> getUser(String userId) async {
    try {
      final response = firestore.collection('user').doc(userId).get();
      return await response.then((doc) {
        if (doc.exists) {
          return UserData.fromDocument(doc);
        } else {
          throw Exception('User not found');
        }
      });
    } catch (e) {
      throw Exception('Error fetching user');
    }
  }
}
