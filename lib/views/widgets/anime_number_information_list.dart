import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_number_information.dart';
import 'package:flutter/material.dart';

class AnimeNumInformationList extends StatelessWidget {
  const AnimeNumInformationList({super.key,required this.anime});
   final  Anime anime;
  @override
  Widget build(BuildContext context) {
    String rating =
        "${anime.averageRating![0]}.${anime.averageRating![1]} / 10";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          AnimeNumInformation(
            text: rating,
            name: "Rating",
            icon: const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          AnimeNumInformation(
            text: anime.favoritesCount!.toString(),
            name: "FavoriteCount",
            icon: const Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          AnimeNumInformation(
            text: anime.userCount.toString(),
            name: "UserCount",
            icon: const Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
              size: 30,
            ),)
        ],
      ),
    );
  }
}
