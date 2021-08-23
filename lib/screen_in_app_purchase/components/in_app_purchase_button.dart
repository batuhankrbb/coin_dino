import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
class InAppPurchaseButton extends StatelessWidget {
  const InAppPurchaseButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.getHeight(0.9),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(context.colorScheme.surface),
          ),
          onPressed: null,
          child: buildText(context),
        ),
      ),
    );
  }

  AutoSizeText buildText(BuildContext context) {
    return AutoSizeText(
      "INAPP_SCREEN_BUY_BUTTON_TEXT".tr(),
      style: TextStyle(
        color: context.colorScheme.onSurface,
        fontSize: context.getWidth(0.06),
      ),
    );
  }
}
