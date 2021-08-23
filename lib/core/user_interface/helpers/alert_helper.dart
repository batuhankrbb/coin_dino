import 'package:auto_size_text/auto_size_text.dart';
import '../../../global/utils/global_keys.dart';
import '../../../xscreen_main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../extensions/context_extensions.dart';
import '../../../global/utils/custom_colors.dart';
import '../../navigation/services/navigation_service.dart';

class AlertHelper {
  static final shared = AlertHelper._privateConstructor();

  AlertHelper._privateConstructor();

  void showSnackBar(String message, BuildContext context,
      [bool isPositive = true]) {
    ScaffoldMessenger.of(GlobalKeys.shared.scaffoldKey.currentContext ?? context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isPositive
                ? Icons.check_circle_outline_outlined
                : Icons.highlight_off,
            color: context.colorScheme.onSurface,
            size: context.getHeight(0.03),
          ),
          SizedBox(
            width: context.getWidth(0.01),
          ),
          AutoSizeText(
            message,
            style: TextStyle(fontSize: context.getWidth(0.04)),
            maxLines: 1,
          ),
        ],
      ),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: context.colorScheme.secondaryVariant,
      duration: Duration(seconds: 2),
      elevation: 4,
    ));
  }
}

