import 'package:animena/bloc/cubit/Anime_data/anime_cubit.dart';
import 'package:animena/data/models/Anime_model.dart';
import 'package:animena/data/repository/anime_repo.dart';
import 'package:animena/data/wepServices/anime_web_ser.dart';
import 'package:animena/views/widgets/anime_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  List<Anime> searchAnime = [];
  AnimeCubit? animeCubit;
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    animeCubit = AnimeCubit(AnimeRepository(AnimeWebService()));
    getAnimes("");
  }

  Future<void> getAnimes(String s) async {
    try {

      List<Anime> list = await animeCubit!.getAllSearchAnimes(s);

      setState(() {
        searchAnime=list;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch animes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 89, 22),
        title: Container(
            padding: EdgeInsets.only(top: 5,left: 30),
            width: 200,
            height: 100,
            child: TextFormField(
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration:const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {


              getAnimes(value);
              },
            ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 8, 31, 8),
      body:isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimeList(allAnime: searchAnime),
            const  SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //     style:const ButtonStyle(
              //         backgroundColor: MaterialStatePropertyAll(
              //             Color.fromARGB(255, 8, 31, 8))),
              //     onPressed: () {
              //       getAnimes();
              //     },
              //     child: Row(
              //       children: [
              //         Text(
              //           "next   ",
              //           style:
              //           TextStyle(fontSize: 20, color: Colors.white),
              //         ),
              //         Icon(
              //           Icons.arrow_forward,
              //           color: Colors.white,
              //         )
              //       ],
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
