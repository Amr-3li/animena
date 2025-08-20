import 'package:animena/core/exeption_services/failures.dart';
import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory.dart';
import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:dartz/dartz.dart';

class GetAnimeByCatigoryRepoImpl implements GetAnimeByCatigoryRepo {
  final GetAnimeByCatigory getAnimeByCatigory;

  GetAnimeByCatigoryRepoImpl(this.getAnimeByCatigory);
  @override
  Future<Either<Failure, List<Anime>>> getAnimeByCategory(
      String category) async {
    try {
      final result = await getAnimeByCatigory.fetchAnimeByCategory(category);
      print("Fetched ${result.length} animes for category: $category");
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
