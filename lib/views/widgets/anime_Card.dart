// ignore: file_names
import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/pages/app_pages/anime_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key, required this.anime});
  final Anime? anime;
  @override
  Widget build(BuildContext context) {
    String reting = anime!.averageRating!;
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AnimeDetailsView(anime: anime!);
            },
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          width: 125.w,
          child: Column(
            children: [
              SizedBox(
                height: 160.h,
                width: 125.w,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: anime!.posterImage!,
                    filterQuality: FilterQuality.low,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 160.h,
                      width: 125.w,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 84, 103, 76),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              anime!.nameEn != ""
                  ? Text(
                      "  ${anime!.nameEn!}",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    )
                  : Text(
                      "  ${anime!.nameEnJp!}",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
              Text(
                "${reting[0]}.${reting[1]}  🌟",
                style: TextStyle(
                    color: const Color.fromARGB(255, 121, 121, 121),
                    fontSize: 11.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
