import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_screen_components.dart';

class CashedNetworkImageWidget extends StatelessWidget {
  final String imageURL;
  final double? imageWidth;
  final double? imageHeigth;

  const CashedNetworkImageWidget({
    Key? key,
    required this.imageURL,
    this.imageHeigth,
    this.imageWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: imageWidth ?? 25,
      height: imageHeigth ?? 25,
      placeholder: (context, url) => LoadingScreen(),
      errorWidget: (context,uri,dynamic) => Icon(Icons.error),
    );
  }
}
