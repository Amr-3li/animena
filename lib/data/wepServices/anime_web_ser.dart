import 'package:dio/dio.dart';

class AnimeWebService {
  Dio? dio;
  AnimeWebService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://kitsu.io/api/edge",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/vnd.api+json",
        },
      ),
    );
  }
  int countAll = 0;

  Future<List<dynamic>> getAllAnime() async {
    try {
      List<dynamic> result = [];
      countAll++;
      int count1 = (countAll) * 18;

      Response response1 = await dio!.get(
          "https://kitsu.io/api/edge/anime?page[limit]=18&page[offset]=$count1");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        result.add(item['attributes']);
      }
      return result;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  int countCat = 0;

  Future<List<dynamic>> getCategoryAnime(String category) async {
    try {
      List<dynamic> result = [];
      countCat++;
      int count1 = (countCat) * 18;

      Response response1 = await dio!.get(
          "https://kitsu.io/api/edge/anime?page[limit]=18&page[offset]=$count1&filter[categories]=$category");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        result.add(item['attributes']);
      }
      print(result.length);
      return result;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getAllSearchAnime(String s) async {
    try {
      List<dynamic> resultSearch = [];

      Response response1 = await dio!.get(
          "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0&filter[text]=$s");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        resultSearch.add(item['attributes']);
      }

      return resultSearch;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getRatingAnime() async {
    try {
      List<dynamic> results = [];
      Response response1 = await dio!.get(
          "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0&sort=-averageRating");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        results.add(item['attributes']);
      }

      return results;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getFavAnime() async {
    try {
      List<dynamic> results = [];
      Response response1 = await dio!.get(
          "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0&sort=-favoritesCount");

      List<dynamic> items = [];
      items.addAll(response1.data["data"]);

      for (var item in items) {
        results.add(item['attributes']);
      }

      return results;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
