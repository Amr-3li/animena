import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeInformationName extends StatelessWidget {
  const AnimeInformationName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 8, 31, 8),
      width: 200,
      height: 60,
      child: Text(
        textAlign: TextAlign.end,
        " $name",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: .5,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
