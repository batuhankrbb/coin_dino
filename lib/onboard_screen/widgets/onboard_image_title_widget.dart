import 'package:coin_dino/core/image/image_helper.dart';
import 'package:coin_dino/global/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';

class OnboardScreenImageAndTitleWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  OnboardScreenImageAndTitleWidget({
    Key? key,
    required this.description,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 70,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ImageHelper.shared.getAssetImage(imageName: image))),
        Spacer(flex: 10),
        Expanded(
            flex: 8,
            child: Container(
                child:
                    Text(title, style: TextStyle().styleeeeeeee, maxLines: 1))),
        Spacer(flex: 3),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
