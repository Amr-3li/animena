import 'package:animena/bloc/anime_cubit.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/views/pages/app_pages/search_page.dart';
import 'package:animena/views/widgets/all_anime.dart';
import 'package:animena/views/widgets/appar_text.dart';
import 'package:animena/views/widgets/spcific_anime.dart';
import 'package:flutter/material.dart';

import '../../../data/models/Anime_model.dart';
import '../../../data/wepServices/anime_web_ser.dart';

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
    animeCubit = AnimeCubit(AnimeRepository(AnimeWebService()));
    getAnimes();
  }

  Future<void> getAnimes() async {
    try {
      rating_animes = await animeCubit!.getRatingAnimes();
      fav_animes = await animeCubit!.getFavAnimes();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 31, 8),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ApparText(name: "Animena"),
        ),
        backgroundColor: Color.fromARGB(255, 22, 89, 22),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                color: Color.fromARGB(255, 8, 31, 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Spicific_widget(
                        animes: fav_animes, name: "Most favorite Anime"),
                    Divider(
                      height: 0.5,
                      color: Colors.white,
                      endIndent: 50,
                      indent: 50,
                    ),
                    Spicific_widget(
                      animes: rating_animes,
                      name: "Most Rating Anime",
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.white,
                      endIndent: 50,
                      indent: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AllAnime(
                      name: "All Animes",
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
