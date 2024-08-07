import 'package:flutter/material.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5,left: 30),
        width: 200,
        height: 100,
        child: TextFormField(
          cursorColor: Colors.white,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ));
  }
}
