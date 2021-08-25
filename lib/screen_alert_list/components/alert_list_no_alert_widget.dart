import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertListNoAlertWidget extends StatelessWidget {
  const AlertListNoAlertWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "ALERT_LIST_SCREEN.NO_ALERT_TITLE".tr(),
            maxLines: 1,
            style: TextStyle(
                fontSize: context.getWidth(0.06), fontWeight: FontWeight.w500, color: context.colorScheme.primary,),
          ),
          AutoSizeText(
            "ALERT_LIST_SCREEN.NO_ALERT_SUBTITLE".tr(),
            maxLines: 2,
            style: TextStyle(fontSize: context.getWidth(0.03), color: context.colorScheme.primary,),
          ),
        ],
      ),
    );
  }
}
