import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/utils/number_helper.dart';
import '../../../features/alert/domain/entity/alert_entity.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertCellPricesWidget extends StatelessWidget {
  const AlertCellPricesWidget({
    Key? key,
    required this.alertEntity,
  }) : super(key: key);

  final AlertEntity alertEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 3,
          child: AutoSizeText(
            "ALERT_LIST_SCREEN.ALERT_CELL_TARGET_TEXT".tr(args: [
              "\$${NumberHelper.shared.toCommaString(number: alertEntity.targetPrice ?? 0)}"
            ]),
            maxLines: 1,
            style: TextStyle(fontSize: context.getWidth(0.04)),
            textAlign: TextAlign.end,
          ),
        ),
        Spacer(),
        Flexible(
          flex: 3,
          child: AutoSizeText(
            "ALERT_LIST_SCREEN.ALERT_CELL_CURRENT_TEXT".tr(args: [
              "\$${NumberHelper.shared.toCommaString(number: alertEntity.currentPrice)}"
            ]),
            maxLines: 1,
            style: TextStyle(fontSize: context.getWidth(0.04)),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
