// ignore_for_file: non_constant_identifier_names

import 'package:animena/features/anime_catigories/presentation/cubit/animes_by_catigory/animes_by_catigory_cubit.dart';
import 'package:animena/features/home/data/models/Anime_model.dart';
import 'package:animena/features/home/presentation/views/widgets/anime_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeListCategory extends StatefulWidget {
  const AnimeListCategory({super.key, required this.Category});
  final String Category;
  @override
  State<AnimeListCategory> createState() => _AnimeListCategoryState();
}

class _AnimeListCategoryState extends State<AnimeListCategory> {
  List<Anime> animes = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimesByCatigoryCubit, AnimesByCatigoryState>(
      listener: (context, state) {
        if (state is AnimesByCatigoryError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Failed to load animes by category")));
        } else if (state is AnimesByCatigoryLoaded) {
          animes.addAll(state.animes);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.Category),
            backgroundColor: const Color.fromARGB(255, 22, 89, 22),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 31, 8),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimeList(allAnime: animes),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  state is AnimesByCatigoryLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 8, 31, 8))),
                          onPressed: () async {
                            await context
                                .read<AnimesByCatigoryCubit>()
                                .fetchAnimesByCategory(widget.Category);
                          },
                          child: Row(
                            children: [
                              Text(
                                "next   ",
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.white),
                              ),
                              const Icon(
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
