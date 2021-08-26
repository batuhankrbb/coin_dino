import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/mini_services/image/image_helper.dart';

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
          child: buildAssetImage(context),
        ),
        Spacer(flex: 3),
        Expanded(
          flex: 8,
          child: buildTitleText(context),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 15,
          child: buildDescriptionText(context),
        ),
        Spacer(
          flex: 3,
        )
      ],
    );
  }

  Container buildDescriptionText(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.getWidth(0.05)),
      child: AutoSizeText(
        description,
        style: TextStyle(
          fontSize: context.getWidth(0.04),
          color: context.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildTitleText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.05)),
      child: AutoSizeText(
        title,
        style: TextStyle(
          fontSize: 60,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  Container buildAssetImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.getWidth(0.05)),
      child: ImageHelper.shared.getAssetImage(imageName: image),
    );
  }
}
