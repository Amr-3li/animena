// ignore_for_file: must_be_immutable

part of 'anime_cubit.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}

final class AnimeLoading extends AnimeState {}

final class AnimeLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeLoaded(this.animes);
}

final class AnimeError extends AnimeState {
  String? error;
  AnimeError(this.error);
}

//get category aninmes state ===============================
final class AnimeCategoryLoading extends AnimeState {}

final class AnimeCategoryLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeCategoryLoaded(this.animes);
}

final class AnimeCategoryError extends AnimeState {
  String? error;
  AnimeCategoryError(this.error);
}

// anime most rating state ===============================
final class AnimeMostRatingLoading extends AnimeState {}

final class AnimeMostRatingLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeMostRatingLoaded(this.animes);
}

final class AnimeMostRatingError extends AnimeState {
  String? error;
  AnimeMostRatingError(this.error);
}

// anime most favorite state ===============================
final class AnimeMostFavoriteLoading extends AnimeState {}

final class AnimeMostFavoriteLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeMostFavoriteLoaded(this.animes);
}

final class AnimeMostFavoriteError extends AnimeState {
  String? error;
  AnimeMostFavoriteError(this.error);
}
// anime search state ===============================
final class AnimeSearchLoading extends AnimeState {}

final class AnimeSearchLoaded extends AnimeState {
  List<Anime>? animes;
  AnimeSearchLoaded(this.animes);
}

final class AnimeSearchError extends AnimeState {
  String? error;
  AnimeSearchError(this.error);
}
