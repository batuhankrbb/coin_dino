import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertDetailExplanationText extends StatelessWidget {
  const AlertDetailExplanationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primaryVariant,
      alignment: Alignment.center,
      padding: EdgeInsets.all(context.getWidth(0.03)),
      child: AutoSizeText(
        "ALERT_DETAIL_SCREEN_EXPLANATION_TEXT".tr(),
        maxLines: 4,
        style: TextStyle(
          fontSize: context.getWidth(0.05),
        ),
      ),
    );
  }
}
