import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CostumBookImage extends StatelessWidget {
  const CostumBookImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.fill,
          )),
    );
  }
}
