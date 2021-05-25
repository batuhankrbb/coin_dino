import 'package:flutter/material.dart';

extension ImageExtensions on Image {
  Image getAssetImage({required String imageName}) =>
      Image.asset("assets/images/$imageName.png");
}

abstract class Local {
  const factory Local.iamge() = _LocalImage;
}

class _LocalImage extends Local {
  
}