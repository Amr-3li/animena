import 'package:flutter/material.dart';

class ApparText extends StatelessWidget {
  const ApparText({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.white),
    );
  }
}
