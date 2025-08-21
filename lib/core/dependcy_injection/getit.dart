import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo.dart';
import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo_impl.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory_impl.dart';
import 'package:animena/features/auth/data/repository/auth_repo.dart';
import 'package:animena/features/auth/data/repository/auth_repo_impl.dart';
import 'package:animena/features/auth/data/services/auth_serv.dart';
import 'package:animena/features/auth/data/services/auth_serv_impl.dart';
import 'package:animena/features/profile/data/repo/get_user_repo.dart';
import 'package:animena/features/profile/data/repo/get_user_repo_impl.dart';
import 'package:animena/features/profile/data/services/get_user.dart';
import 'package:animena/features/profile/data/services/get_user_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<GetAnimeByCatigory>(GetAnimeByCatigoryImpl());
  getIt.registerSingleton<GetAnimeByCatigoryRepo>(
      GetAnimeByCatigoryRepoImpl(getIt<GetAnimeByCatigory>()));

  getIt.registerFactory<GetUserRepo>(() => GetUserRepoImp(getIt<GetUser>()));
  getIt.registerFactory<GetUser>(() => GetUserImpl());

  getIt.registerFactory<AuthServ>(() => AuthServImpl());
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt<AuthServ>()));
}
