import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/home/presentation/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/features/home/presentation/views/widgets/anime_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Anime> searchAnime = [];
  AnimeCubit? animeCubit;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    animeCubit = BlocProvider.of<AnimeCubit>(context);
    getAnimes("");
  }

  Future<void> getAnimes(String s) async {
    try {
      List<Anime> list = await animeCubit!.getAllSearchAnimes(s);

      setState(() {
        searchAnime = list;
      });
    } catch (e) {
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 22, 89, 22),
            actions: [
              IconButton(
                onPressed: () {
                  getAnimes(searchController.text);
                },
                icon: const Icon(Icons.search),
                color: Colors.white,
                iconSize: 30,
              ),
            ],
            title: Container(
              padding: const EdgeInsets.only(top: 5, left: 30),
              width: 200,
              height: 100,
              child: TextFormField(
                controller: searchController,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 31, 8),
          body: state is AnimeSearchLoading || searchAnime.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimeList(allAnime: searchAnime),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
