import 'package:flutter/material.dart';

class AnimeNumInformation extends StatelessWidget {
  const AnimeNumInformation({super.key,required this.text,required this.name,required this.icon});
  final String ? text ,name;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(200, 94, 107, 92),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
         icon!,
          Text(
            text!,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name!,
            style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(200, 189, 189, 189)),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
