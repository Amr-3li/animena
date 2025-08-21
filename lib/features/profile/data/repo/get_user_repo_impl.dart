import 'package:animena/core/exeption_services/failures.dart';
import 'package:animena/features/profile/data/model/user.dart';
import 'package:animena/features/profile/data/repo/get_user_repo.dart';
import 'package:animena/features/profile/data/services/get_user.dart';
import 'package:dartz/dartz.dart';

class GetUserRepoImp implements GetUserRepo {
  final GetUser getUserService;

  GetUserRepoImp(this.getUserService);
  @override
  Future<Either<Failure, UserData>> getUser(String userId) async {
    try {
      final result = await getUserService.getUser(userId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
