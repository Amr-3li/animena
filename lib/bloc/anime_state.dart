part of 'anime_cubit.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}

final class AnimeLoading extends AnimeState {}

final class AnimeLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeLoaded( this.animes);
}

final class AnimeError extends AnimeState {}
