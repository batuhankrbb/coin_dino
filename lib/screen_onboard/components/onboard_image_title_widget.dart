import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
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
          flex: 55,
          child: buildAssetImage(),
        ),
        Spacer(flex: 2),
        Expanded(
          flex: 9,
          child: buildTitleText(context),
        ),
        Spacer(flex: 3),
        Expanded(
          flex: 15,
          child: buildDescriptionText(context),
        ),
      ],
    );
  }

  Container buildDescriptionText(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: AutoSizeText(
        description,
        style: context.descriptionStyle(
          fontSize: context.getWidth(0.05),
        ),
      ),
    );
  }

  Container buildTitleText(BuildContext context) {
    return Container(
      child: AutoSizeText(
        title,
        style: context.rockoFLFStyle().copyWith(fontSize: 60),
      ),
    );
  }

  Container buildAssetImage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ImageHelper.shared.getAssetImage(imageName: image),
    );
  }
}
