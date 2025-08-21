import 'package:animena/core/exeption_services/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signup(
      String name, String email, String password, String phone);
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
