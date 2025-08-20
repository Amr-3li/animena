import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/home/presentation/views/widgets/anime_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key, required this.allAnime});
  final List<Anime> allAnime;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(parent: ScrollPhysics()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5.w,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: allAnime.length,
      itemBuilder: (context, index) {
        return AnimeCard(anime: allAnime[index]);
      },
    );
  }
}
