import 'package:animena/views/widgets/anime_caregory.dart';
import 'package:animena/views/widgets/appar_text.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ApparText(name: "Categorys"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: const Color.fromARGB(255, 8, 31, 8),
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return AnimeCategory(data: categories[index]);
        },
      ),
    );
  }
}
