import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/data/wepServices/anime_web_ser.dart';
import 'package:animena/views/widgets/anime_list.dart';
import 'package:flutter/material.dart';

class AnimeListCategory extends StatefulWidget {
  const AnimeListCategory({super.key, required this.Category});
  final String Category;
  @override
  State<AnimeListCategory> createState() => _AnimeListCategoryState();
}

class _AnimeListCategoryState extends State<AnimeListCategory> {
  AnimeCubit? animeCubit;
  List<Anime> allAnime = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    animeCubit = AnimeCubit(AnimeRepository(AnimeWebService()));
    getAnimes();
  }

  Future getAnimes() async {
    try {
      List<Anime> l = await animeCubit!.getCategoryAnimes(widget.Category);
      setState(() {
        isLoading = false;
        allAnime.addAll(l);
      });
    } catch (e) {
      // Handle errors here, e.g., show a message to the user
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Category),
        backgroundColor: Color.fromARGB(255, 22, 89, 22),
      ),
      backgroundColor: Color.fromARGB(255, 8, 31, 8),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimeList(allAnime: allAnime),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 8, 31, 8))),
                        onPressed: () {
                          getAnimes();
                        },
                        child: Row(
                          children: [
                            Text(
                              "next   ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
  }
}
