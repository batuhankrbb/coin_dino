import 'package:auto_size_text/auto_size_text.dart';
import '../../global/components/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class AlertDetailHeader extends StatelessWidget {
  AlertDetailHeader(
      {Key? key,
      required this.imageUrl,
      required this.coinName,
      required this.symbol})
      : super(key: key);

  String imageUrl;
  String coinName;
  String symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: buildCoinImage(context),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: buildCoinText(context),
        ),
      ],
    );
  }

  CachedNetworkImageWidget buildCoinImage(BuildContext context) {
    return CachedNetworkImageWidget(
          imageURL: imageUrl,
          imageHeigth: context.getHeight(0.15),
          imageWidth: context.getHeight(0.15),
        );
  }

  AutoSizeText buildCoinText(BuildContext context) {
    return AutoSizeText(
          "$coinName($symbol)",
          style: TextStyle(
              fontSize: context.getWidth(0.05), fontWeight: FontWeight.w500, color: context.colorScheme.primary,),
          maxLines: 1,
        );
  }
}
