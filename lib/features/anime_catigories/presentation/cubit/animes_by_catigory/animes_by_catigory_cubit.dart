import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo.dart';
import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animes_by_catigory_state.dart';

class AnimesByCatigoryCubit extends Cubit<AnimesByCatigoryState> {
  AnimesByCatigoryCubit(this.getAnimeByCatigoryRepo)
      : super(AnimesByCatigoryInitial());
  final GetAnimeByCatigoryRepo getAnimeByCatigoryRepo;
  Future<void> fetchAnimesByCategory(String category) async {
    emit(AnimesByCatigoryLoading());
    final result = await getAnimeByCatigoryRepo.getAnimeByCategory(category);
    result.fold(
      (failure) => emit(AnimesByCatigoryError()),
      (animes) => emit(AnimesByCatigoryLoaded(animes)),
    );
  }
}
