import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_data_information.dart';
import 'package:flutter/material.dart';

class AnimeDataInformationList extends StatelessWidget {
  const AnimeDataInformationList({super.key, required this.anime});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(70, 142, 192, 104),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            AnimeDataInformation(
                text: "Start date", description: anime.startDate!),
            SizedBox(
              height: 10,
            ),
            AnimeDataInformation(text: "End date", description: anime.endDate!),
            SizedBox(
              height: 10,
            ),
            AnimeDataInformation(text: "Status", description: anime.status!),
            SizedBox(
              height: 10,
            ),
            AnimeDataInformation(
                text: "japanese name ", description: anime.nameJp!),
            SizedBox(
              height: 10,
            ),

               AnimeDataInformation(
                  text: "Description ", description: ""),
            SizedBox(height: 10,),
            Text(
              " ${anime.description!}",
              maxLines: 50,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 17),
            ),

          ],
        ),
      ),
    );
  }
}
