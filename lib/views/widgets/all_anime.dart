// ignore_for_file: use_build_context_synchronously

import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/data/wepServices/anime_web_ser.dart';
import 'package:animena/views/widgets/anime_list.dart';
import 'package:flutter/material.dart';

class AllAnime extends StatefulWidget {
  const AllAnime({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  State<AllAnime> createState() => _AllAnimeState();
}

class _AllAnimeState extends State<AllAnime> {
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
      List<Anime> l = await animeCubit!.getAnimes();
      setState(() {
        isLoading = false;
        allAnime.addAll(l);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "   ${widget.name}",
          style: const TextStyle(fontSize: 23, color: Colors.white),
        ),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : AnimeList(allAnime: allAnime),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 8, 31, 8))),
            onPressed: () {
              getAnimes();
            },
            child: const Row(
              children: [
                Text(
                  "more animes   ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            )),
      ],
    );
  }
}
