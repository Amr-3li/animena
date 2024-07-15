import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeDataInformation extends StatelessWidget {
  const AnimeDataInformation({super.key,required this.text,required this.description});
  final String text,description;
  @override
  Widget build(BuildContext context) {
    return  Row(
      verticalDirection: VerticalDirection.down,
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        Text(
          " ${text} : ",
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        SizedBox(width: 30),
        Flexible(
          child: Text(
            " ${description}",
            maxLines: 20,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white70, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
