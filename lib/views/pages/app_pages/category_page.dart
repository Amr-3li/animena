// ignore_for_file: must_be_immutable

import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/data/wepServices/anime_web_ser.dart';
import 'package:animena/views/widgets/anime_caregory.dart';
import 'package:animena/views/widgets/appar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  List<List<String>> categories = [
    ["assets/Images/action.png", "action"],
    ["assets/Images/bounty-hunter.png", "gunfights"],
    ["assets/Images/comedy.png", "comedy"],
    ["assets/Images/drama.png", "drama"],
    ["assets/Images/detective.png", "detective"],
    ["assets/Images/future.png", "future"],
    ["assets/Images/post-apocalypse.png", "post-apocalypse"],
    ["assets/Images/Scientific.png", "science-fiction"],
    ["assets/Images/space.png", "space"],
    ["assets/Images/adventure.png", "adventure"],
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeCubit(AnimeRepository(AnimeWebService())),
      child: Scaffold(
        appBar: AppBar(
          title: const ApparText(name: "Categorys"),
          backgroundColor: Colors.teal,
        ),
        backgroundColor: const Color.fromARGB(255, 8, 31, 8),
        body: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
          itemBuilder: (context, index) {
            return AnimeCategory(data: categories[index]);
          },
        ),
      ),
    );
  }
}
