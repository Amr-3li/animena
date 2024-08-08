import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/data/wepServices/anime_web_ser.dart';
import 'package:animena/views/pages/app_pages/anime_list_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeCategory extends StatelessWidget {
  const AnimeCategory({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) =>
                  AnimeCubit(AnimeRepository(AnimeWebService())),
              child: AnimeListCategory(
                Category: data[1],
              ),
            );
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(200, 6, 68, 58),
          ),
          width: 190,
          height: 190,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                data[0],
                height: 110,
                width: 110,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data[1],
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
