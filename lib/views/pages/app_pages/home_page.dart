// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/views/pages/app_pages/search_page.dart';
import 'package:animena/views/widgets/all_anime.dart';
import 'package:animena/views/widgets/appar_text.dart';
import 'package:animena/views/widgets/spcific_anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/Anime_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Anime> rating_animes = [];
  List<Anime> fav_animes = [];
  AnimeCubit? animeCubit;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    animeCubit = BlocProvider.of<AnimeCubit>(context);
    getAnimes();
  }

  Future<void> getAnimes() async {
    try {
      rating_animes = await animeCubit!.getRatingAnimes();

      fav_animes = await animeCubit!.getFavAnimes();

      setState(() {});
    } catch (e) {
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 8, 31, 8),
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: ApparText(name: "Animena"),
            ),
            backgroundColor: const Color.fromARGB(255, 22, 89, 22),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ));
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              color: const Color.fromARGB(255, 8, 31, 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  state is AnimeMostFavoriteLoading && fav_animes.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Spicific_widget(
                          animes: fav_animes, name: "Most favorite Anime"),
                  const Divider(
                    height: 0.5,
                    color: Colors.white,
                    endIndent: 50,
                    indent: 50,
                  ),
                  state is AnimeMostRatingLoading && rating_animes.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Spicific_widget(
                          animes: rating_animes,
                          name: "Most Rating Anime",
                        ),
                  const Divider(
                    height: 0.5,
                    color: Colors.white,
                    endIndent: 50,
                    indent: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AllAnime(
                    name: "All Animes",
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
