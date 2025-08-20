import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_cover_mage.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_data_information_list.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_number_information_list.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_name.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_poster_image.dart';
import 'package:animena/features/home/presentation/views/widgets/appar_text.dart';
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                AnimeCoverImage(image: anime.coverImage!),
                Row(
                  children: [
                    AnimePosterImage(name: anime.posterImage!),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        AnimeInformationName(name: " ${anime.nameEnJp}")
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            AnimeNumInformationList(anime: anime),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            AnimeDataInformationList(anime: anime)
          ],
        ),
      ),
    );
  }
}
