import 'package:animena/core/exeption_services/failures.dart';
import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetAnimeByCatigoryRepo {
  // Define the methods that this repository should implement
  Future<Either<Failure, List<Anime>>> getAnimeByCategory(String category);
}
