import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertDetailExecuteButton extends StatefulWidget {
  AlertDetailExecuteButton(
      {Key? key, required this.onTap, required this.isUpdate})
      : super(key: key);

  @override
  _AlertDetailExecuteButtonState createState() =>
      _AlertDetailExecuteButtonState();

  VoidCallback onTap;
  bool isUpdate;
}

class _AlertDetailExecuteButtonState extends State<AlertDetailExecuteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(0.9),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.colorScheme.secondary)),
        onPressed: widget.onTap,
        child: buildText(context),
      ),
    );
  }

  AutoSizeText buildText(BuildContext context) {
    return AutoSizeText(
      widget.isUpdate
          ? "ALERT_DETAIL_SCREEN.BUTTON_UPDATE_TEXT".tr()
          : "ALERT_DETAIL_SCREEN.BUTTON_SAVE_TEXT".tr(),
      style: TextStyle(
        color: context.colorScheme.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: context.getWidth(0.042),
      ),
      maxLines: 1,
    );
  }
}
