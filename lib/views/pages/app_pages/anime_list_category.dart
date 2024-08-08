// ignore_for_file: non_constant_identifier_names

import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/views/widgets/anime_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeListCategory extends StatefulWidget {
  const AnimeListCategory({super.key, required this.Category});
  final String Category;
  @override
  State<AnimeListCategory> createState() => _AnimeListCategoryState();
}

class _AnimeListCategoryState extends State<AnimeListCategory> {
  AnimeCubit? animeCubit;
  List<Anime> allAnime = [];

  @override
  void initState() {
    super.initState();
    animeCubit = BlocProvider.of<AnimeCubit>(context);

    getAnimes();
  }

  Future getAnimes() async {
    try {
      List<Anime> l = await animeCubit!.getCategoryAnimes(widget.Category);
      setState(() {
        allAnime.addAll(l);
      });
    } catch (e) {
      // Handle errors here, e.g., show a message to the user
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.Category),
            backgroundColor: const Color.fromARGB(255, 22, 89, 22),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 31, 8),
          body: state is AnimeCategoryLoading || allAnime.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimeList(allAnime: allAnime),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 8, 31, 8))),
                            onPressed: () {
                              getAnimes();
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "next   ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
