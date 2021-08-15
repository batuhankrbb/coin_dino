import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class AlertDetailCurrentPriceText extends StatelessWidget {
  AlertDetailCurrentPriceText({Key? key, required this.currentPrice})
      : super(key: key);

  num currentPrice;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Current Price : \$$currentPrice",
      style: TextStyle(fontSize: context.getWidth(0.04)),
    );
  }
}
