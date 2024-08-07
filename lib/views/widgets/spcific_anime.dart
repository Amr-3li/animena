import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_Card.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Spicific_widget extends StatelessWidget {
  const Spicific_widget({super.key, required this.animes, required this.name});
  final String name;
  final List<Anime>? animes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "   $name",
              style: const TextStyle(fontSize: 23, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: animes!.length,
                itemBuilder: (context, index) {
                  return AnimeCard(
                    anime: animes![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
