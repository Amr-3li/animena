import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeCoverImage extends StatelessWidget {
  const AnimeCoverImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310.h,
      color: const Color.fromARGB(255, 8, 31, 8),
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: const BoxDecoration(),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
