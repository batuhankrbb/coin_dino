import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_screen.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageURL;
  final double? imageWidth;
  final double? imageHeigth;

  const CachedNetworkImageWidget(
      {Key? key, required this.imageURL, this.imageHeigth, this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: imageWidth ?? 25,
      height: imageHeigth ?? 25,
      placeholder: (context, url) => LoadingScreen(isSmallLoading: true,),
      errorWidget: (context, uri, _) => LoadingScreen(isSmallLoading: true,),
    );
  }
}
