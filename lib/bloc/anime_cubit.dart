import 'package:animena/data/repository/anime_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/Anime_model.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeRepository animeRepository;

  AnimeCubit(this.animeRepository) : super(AnimeInitial());
  Future<List<Anime>> getAnimes() async {
    List<Anime> animes = [];
    await animeRepository.getAnimes().then((value) {
      emit(AnimeLoaded(value));
      animes = value;
    });
    return animes;
  }
  Future<List<Anime>> getCategoryAnimes(String s) async {
    List<Anime> animes = [];
    await animeRepository.getCategoryAnimes(s).then((value) {
      emit(AnimeLoaded(value));
      animes = value;
    });
    return animes;
  }
  Future<List<Anime>> getAllSearchAnimes(String s) async {
    List<Anime> animes = [];
    await animeRepository.getAllSearchAnimes(s).then((value) {
      emit(AnimeLoaded(value));
      animes = value;
    });
    return animes;
  }

  Future<List<Anime>> getRatingAnimes() async {
    List<Anime> animes = [];
    await animeRepository.getRatingAnimes().then((value) {
      emit(AnimeLoaded(value));
      animes = value;
    });
    return animes;
  }

  Future<List<Anime>> getFavAnimes() async {
    List<Anime> animes = [];
    await animeRepository.getFavAnimes().then((value) {
      emit(AnimeLoaded(value));
      animes = value;
    });
    return animes;
  }
}
