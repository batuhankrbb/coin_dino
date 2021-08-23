import 'package:auto_size_text/auto_size_text.dart';
import '../../core/utils/number_helper.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertDetailCurrentPriceText extends StatelessWidget {
  AlertDetailCurrentPriceText({Key? key, required this.currentPrice})
      : super(key: key);

  num currentPrice;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "ALERT_DETAIL_SCREEN_CURRENT_PRICE_TEXT".tr(args: ["\$${NumberHelper.shared.toCommaString(number: currentPrice)}"]),
      style: TextStyle(
        fontSize: context.getWidth(0.04),
      ),
      maxLines: 1,
    );
  }
}
