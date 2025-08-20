// ignore_for_file: unused_catch_clause

import 'package:animena/core/constants/secrets.dart';
import 'package:animena/features/anime_catigories/data/services/get_anime_by_catigory.dart';
import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:dio/dio.dart';

class GetAnimeByCatigoryImpl implements GetAnimeByCatigory {
  int countCat = 0;

  get dio => Dio();
  @override
  Future<List<Anime>> fetchAnimeByCategory(String category) async {
    try {
      List<dynamic> result = [];
      countCat++;
      int count1 = (countCat) * 18;

      Response response1 = await dio.get(
          "${baseUrlAnime}page[limit]=18&page[offset]=$count1&filter[categories]=$category");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        result.add(item['attributes']);
      }

      final animes = result.map((e) => Anime.fromJson(e)).toList();

      return animes;
    } on Exception catch (e) {
      throw Exception("Failed to fetch anime by category");
    }
  }
}
