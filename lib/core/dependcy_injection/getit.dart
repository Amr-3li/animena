import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo.dart';
import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo_impl.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<GetAnimeByCatigory>(GetAnimeByCatigoryImpl());
  getIt.registerSingleton<GetAnimeByCatigoryRepo>(
      GetAnimeByCatigoryRepoImpl(getIt<GetAnimeByCatigory>()));
}
