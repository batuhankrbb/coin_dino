import 'package:flutter/material.dart';

class ImageHelper {
  static final shared = ImageHelper();

  Image getAssetImage({required String imageName}) {
    return Image.asset("assets/images/$imageName.png");
  }
}
