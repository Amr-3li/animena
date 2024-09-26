import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_data_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: const Color.fromARGB(70, 142, 192, 104),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AnimeDataInformation(
                text: "Start date", description: anime.startDate!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimeDataInformation(text: "End date", description: anime.endDate!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimeDataInformation(text: "Status", description: anime.status!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimeDataInformation(
                text: "japanese name ", description: anime.nameJp!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const AnimeDataInformation(text: "Description ", description: ""),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              " ${anime.description!}",
              maxLines: 50,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }
}
