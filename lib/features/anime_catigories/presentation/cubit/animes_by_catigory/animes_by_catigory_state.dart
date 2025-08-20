part of 'animes_by_catigory_cubit.dart';

@immutable
sealed class AnimesByCatigoryState {}

final class AnimesByCatigoryInitial extends AnimesByCatigoryState {}

final class AnimesByCatigoryLoading extends AnimesByCatigoryState {}

final class AnimesByCatigoryLoaded extends AnimesByCatigoryState {
  final List<Anime> animes;

  AnimesByCatigoryLoaded(this.animes);
}

final class AnimesByCatigoryError extends AnimesByCatigoryState {}
