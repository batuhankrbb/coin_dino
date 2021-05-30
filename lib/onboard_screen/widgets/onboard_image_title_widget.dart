
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/mini_services/image/image_helper.dart';
import '../../global/extensions/style_extensions.dart';

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
        Spacer(flex: 2),
        Expanded(
          flex: 6,
          child: Container(
            child: AutoSizeText(title, style: context.rockoFLFStyle()),
          ),
        ),
        Spacer(flex: 3),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(description, style: context.descriptionStyle()),
          ),
        ),
      ],
    );
  }
}
