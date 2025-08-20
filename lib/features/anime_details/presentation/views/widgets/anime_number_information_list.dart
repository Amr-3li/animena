import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/anime_details/presentation/views/widgets/anime_number_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeNumInformationList extends StatelessWidget {
  const AnimeNumInformationList({super.key, required this.anime});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    String rating =
        "${anime.averageRating![0]}.${anime.averageRating![1]} / 10";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          AnimeNumInformation(
            text: rating,
            name: "Rating",
            icon: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 30.sp,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          AnimeNumInformation(
            text: anime.favoritesCount!.toString(),
            name: "FavoriteCount",
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 30.sp,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          AnimeNumInformation(
            text: anime.userCount.toString(),
            name: "UserCount",
            icon: const Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
