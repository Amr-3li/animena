import 'package:animena/features/home/data/models/Anime_model.dart';

abstract class GetAnimeByCatigory {
  // Define the methods that this service should implement
  Future<List<Anime>> fetchAnimeByCategory(String category);
}
