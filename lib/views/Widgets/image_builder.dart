import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key, required this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Image.asset(
        'assets/general.avif',
        fit: BoxFit.fill,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url!,
        progressIndicatorBuilder: (context, url, progress) =>
            Center(child: CircularProgressIndicator(value: progress.progress)),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      );
    }
  }
}
