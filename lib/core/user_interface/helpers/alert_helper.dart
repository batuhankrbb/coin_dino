import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../../../global/utils/custom_colors.dart';
import '../../navigation/services/navigation_service.dart';

class AlertHelper {
  static final shared = AlertHelper._privateConstructor();

  AlertHelper._privateConstructor();

  void showCupertinoAlertDialog(
      String title, String message, BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                isDefaultAction: true,
                onPressed: () {
                  NavigationService().goBack();
                },
              )
            ],
          );
        });
  }

  void showSnackBar(String message, BuildContext context,
      [bool isPositive = true]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
