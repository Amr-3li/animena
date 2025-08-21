// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:animena/core/exeption_services/failures.dart';
import 'package:animena/features/auth/data/repository/auth_repo.dart';
import 'package:animena/features/auth/data/services/auth_serv.dart';

class AuthRepoImpl implements AuthRepo {
  AuthServ authService;
  AuthRepoImpl(this.authService);
  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await authService.login(email, password);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authService.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signup(
      String name, String email, String password, String phone) async {
    try {
      await authService.signup(name, email, password, phone);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
