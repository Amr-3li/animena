import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_Card.dart';
import 'package:flutter/material.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key,required this.allAnime});
final List<Anime>allAnime;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      shrinkWrap: true,
      physics: ScrollPhysics(parent: ScrollPhysics()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.62,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: allAnime.length ,
      itemBuilder: (context, index) {
        int count = allAnime.length;

        return AnimeCard(anime: allAnime[index]);

      },
    );
  }
}
