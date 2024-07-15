import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/pages/app_pages/anime_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          width: 125,
          child: Column(
            children: [
              Container(
                height: 160,
                width: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      height: 160,
                      width: 125,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 84, 103, 76),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              anime!.nameEn != ""
                  ? Text(
                      "  " + anime!.nameEn!,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    )
                  : Text(
                      "  " + anime!.nameEnJp!,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
              Text(
                reting[0] + "." + reting[1] + "  🌟",
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 121, 121), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
