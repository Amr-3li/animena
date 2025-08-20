// ignore_for_file: depend_on_referenced_packages

import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/home/data/repository/anime_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeRepository animeRepository;
  @override
  AnimeCubit(this.animeRepository) : super(AnimeInitial());
  Future<List<Anime>> getAnimes() async {
    emit(AnimeLoading());

    try {
      List<Anime> animes = [];
      await animeRepository.getAnimes().then((value) {
        emit(AnimeLoaded(value));
        animes = value;
      });

      return animes;
    } on Exception catch (e) {
      emit(AnimeError(e.toString()));
      return [];
    }
  }

  Future<List<Anime>> getAllSearchAnimes(String s) async {
    emit(AnimeSearchLoading());
    try {
      List<Anime> animes = [];
      await animeRepository.getAllSearchAnimes(s).then((value) {
        emit(AnimeSearchLoaded(value));
        animes = value;
      });
      return animes;
    } on Exception catch (e) {
      AnimeSearchError(e.toString());
      return [];
    }
  }

  Future<List<Anime>> getRatingAnimes() async {
    emit(AnimeMostRatingLoading());
    try {
      List<Anime> animes = [];
      await animeRepository.getRatingAnimes().then((value) {
        emit(AnimeMostRatingLoaded(value));
        animes = value;
      });
      return animes;
    } on Exception catch (e) {
      AnimeMostFavoriteError(e.toString());
      return [];
    }
  }

  Future<List<Anime>> getFavAnimes() async {
    emit(AnimeMostFavoriteLoading());
    try {
      List<Anime> animes = [];
      await animeRepository.getFavAnimes().then((value) {
        emit(AnimeCategoryLoaded(animes));
        animes = value;
      });
      return animes;
    } on Exception catch (e) {
      AnimeMostFavoriteError(e.toString());
      return [];
    }
  }
}
