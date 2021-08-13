import 'package:flutter/material.dart';

class ImageHelper {
  static final shared = ImageHelper._privateConstructor();

  ImageHelper._privateConstructor();

  Image getAssetImage({required String imageName}) {
    return Image.asset("assets/images/$imageName.png");
  }
}
