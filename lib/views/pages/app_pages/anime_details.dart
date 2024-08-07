import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_cover_mage.dart';
import 'package:animena/views/widgets/anime_data_information_list.dart';
import 'package:animena/views/widgets/anime_number_information_list.dart';
import 'package:animena/views/widgets/anime_name.dart';
import 'package:animena/views/widgets/anime_poster_image.dart';
import 'package:animena/views/widgets/appar_text.dart';
import 'package:flutter/material.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({super.key, required this.anime});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 31, 8),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 22, 89, 22),
          title: anime.nameEn != ""
              ? ApparText(name: anime.nameEn!)
              : ApparText(name: anime.nameEnJp!)),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                AnimeCoverImage(image: anime.coverImage!),
                Row(
                  children: [
                    AnimePosterImage(name: anime.posterImage!),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        AnimeInformationName(name: " ${anime.nameEnJp}")
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            AnimeNumInformationList(anime: anime),
            const SizedBox(
              height: 30,
            ),
           AnimeDataInformationList(anime: anime)
          ],
        ),
      ),
    );
  }
}
