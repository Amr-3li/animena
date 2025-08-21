import 'package:animena/core/exeption_services/failures.dart';
import 'package:animena/features/profile/data/model/user.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserRepo {
  Future<Either<Failure, UserData>> getUser(String userId);
}
