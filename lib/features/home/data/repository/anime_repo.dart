import 'package:animena/features/home/data/services/anime_web_ser.dart';
import '../models/Anime_model.dart';

class AnimeRepository {
  AnimeWebService animeWebService;

  AnimeRepository(this.animeWebService);

  Future<List<Anime>> getAnimes() async {
    List<Anime> result = [];
    List<dynamic> animes = await animeWebService.getAllAnime();

    for (var a in animes) {
      Anime anime = Anime(
        nameEn: a['titles']['en'] ?? '',
        nameEnJp: a['titles']['en_jp'] ?? '',
        nameJp: a['titles']['ja_jp'] ?? '',
        description: a['description'] ?? '',
        averageRating: a['averageRating'] ?? '0',
        startDate: a['startDate'] ?? '',
        endDate: a['endDate'] ?? '',
        posterImage:
            a['posterImage'] != null ? a['posterImage']['original'] ?? '' : '',
        coverImage:
            a['coverImage'] != null ? a['coverImage']['original'] ?? '' : '',
        status: a['status'] ?? '',
        popularityRank: a['popularityRank'] ?? 0,
        userCount: a['userCount'] ?? 0,
        favoritesCount: a['favoritesCount'] ?? 0,
      );
      result.add(anime);
    }
    return result;
  }

  Future<List<Anime>> getFavAnimes() async {
    List<Anime> result = [];
    List<dynamic> animes = await animeWebService.getFavAnime();

    for (var a in animes) {
      Anime anime = Anime(
        nameEn: a['titles']['en'] ?? '',
        nameEnJp: a['titles']['en_jp'] ?? '',
        nameJp: a['titles']['ja_jp'] ?? '',
        description: a['description'] ?? '',
        averageRating: a['averageRating'] ?? '0',
        startDate: a['startDate'] ?? '',
        endDate: a['endDate'] ?? '',
        posterImage:
            a['posterImage'] != null ? a['posterImage']['original'] ?? '' : '',
        coverImage:
            a['coverImage'] != null ? a['coverImage']['original'] ?? '' : '',
        status: a['status'] ?? '',
        popularityRank: a['popularityRank'] ?? 0,
        userCount: a['userCount'] ?? 0,
        favoritesCount: a['favoritesCount'] ?? 0,
      );
      result.add(anime);
    }
    return result;
  }

  Future<List<Anime>> getRatingAnimes() async {
    List<Anime> result = [];
    List<dynamic> animes = await animeWebService.getRatingAnime();

    for (var a in animes) {
      Anime anime = Anime(
        nameEn: a['titles']['en'] ?? '',
        nameEnJp: a['titles']['en_jp'] ?? '',
        nameJp: a['titles']['ja_jp'] ?? '',
        description: a['description'] ?? '',
        averageRating: a['averageRating'] ?? '0',
        startDate: a['startDate'] ?? '',
        endDate: a['endDate'] ?? '',
        posterImage:
            a['posterImage'] != null ? a['posterImage']['original'] ?? '' : '',
        coverImage:
            a['coverImage'] != null ? a['coverImage']['original'] ?? '' : '',
        status: a['status'] ?? '',
        popularityRank: a['popularityRank'] ?? 0,
        userCount: a['userCount'] ?? 0,
        favoritesCount: a['favoritesCount'] ?? 0,
      );
      result.add(anime);
    }
    return result;
  }

  Future<List<Anime>> getAllSearchAnimes(String s) async {
    List<Anime> result = [];
    List<dynamic> animes = await animeWebService.getAllSearchAnime(s);

    for (var a in animes) {
      Anime anime = Anime(
        nameEn: a['titles']['en'] ?? '',
        nameEnJp: a['titles']['en_jp'] ?? '',
        nameJp: a['titles']['ja_jp'] ?? '',
        description: a['description'] ?? '',
        averageRating: a['averageRating'] ?? '0',
        startDate: a['startDate'] ?? '',
        endDate: a['endDate'] ?? '',
        posterImage:
            a['posterImage'] != null ? a['posterImage']['original'] ?? '' : '',
        coverImage:
            a['coverImage'] != null ? a['coverImage']['original'] ?? '' : '',
        status: a['status'] ?? '',
        popularityRank: a['popularityRank'] ?? 0,
        userCount: a['userCount'] ?? 0,
        favoritesCount: a['favoritesCount'] ?? 0,
      );
      result.add(anime);
    }
    return result;
  }

  getSearchAnimes(String s) {}
}
