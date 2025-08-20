import 'package:animena/core/dependcy_injection/getit.dart';
import 'package:animena/features/anime_catigories/data/repo/get_anime_by_catigory_repo.dart';
import 'package:animena/features/anime_catigories/presentation/cubit/animes_by_catigory/animes_by_catigory_cubit.dart';
import 'package:animena/features/anime_catigories/presentation/views/pages/anime_list_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  AnimesByCatigoryCubit(getIt<GetAnimeByCatigoryRepo>())
                    ..fetchAnimesByCategory(data[1]),
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
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(200, 6, 68, 58),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Image.asset(
                data[0],
                height: 90.h,
                color: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                data[1],
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
