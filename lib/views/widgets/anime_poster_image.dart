import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimePosterImage extends StatelessWidget {
  const AnimePosterImage({super.key,required this.name});
 final  String name;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: 180,
        height: 180,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: name,
          filterQuality: FilterQuality.low,
          placeholderFadeInDuration: const Duration(seconds: 5),
        ),
      ),
    );
  }
}
