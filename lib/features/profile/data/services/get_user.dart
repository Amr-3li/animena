import 'package:animena/features/profile/data/model/user.dart';

abstract class GetUser {
  Future<UserData> getUser(String userId);
}
