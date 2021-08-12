import 'package:auto_size_text/auto_size_text.dart';
import '../../core/utils/number_helper.dart';
import '../../global/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class CoinDetailHoursTableWidget extends StatelessWidget {
  final String tableTitle;
  final String tablePrice;
  final bool isPricePositive;
  CoinDetailHoursTableWidget(
      {Key? key,
      required this.tablePrice,
      required this.tableTitle,
      required this.isPricePositive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: ShapeDecoration(
          shape: Border.all(
              color: context.colorScheme.secondaryVariant, width: 0.3)),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: buildTitleText(context),
          ),
          Expanded(
            flex: 1,
            child: buildPriceText(context),
          ),
        ],
      ),
    );
  }

  Widget buildPriceText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child: AutoSizeText(
        tablePrice,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isPricePositive
              ? context.colorScheme.secondary
              : context.colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
          fontSize: context.getWidth(0.035),
        ),
        minFontSize: 6,
        maxLines: 1,
      ),
    );
  }

  Widget buildTitleText(BuildContext context) {
    return Container(
      child: AutoSizeText(
        tableTitle,
        style: TextStyle(
          color: context.colorScheme.onSurface,
          fontSize: context.getWidth(0.04),
        ),
        maxLines: 1,
      ),
      alignment: Alignment.center,
      color: CustomColor.shared.backgroundBlueColor,
    );
  }
}
