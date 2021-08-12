import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class CoinDetailInformationRowWidget extends StatelessWidget {
  final String title;
  final String price;
  const CoinDetailInformationRowWidget(
      {Key? key, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: context.getWidth(0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: buildTitleText(context),
          ),
          Expanded(
            child: buildPriceText(context),
          ),
        ],
      ),
    );
  }

  AutoSizeText buildTitleText(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 1,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: context.colorScheme.background,
        fontSize: context.getWidth(0.035),
      ),
    );
  }

  AutoSizeText buildPriceText(BuildContext context) {
    return AutoSizeText(
      price,
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: context.getWidth(0.03),
      ),
      textAlign: TextAlign.end,
    );
  }
}
