import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/services/navigation_service.dart';

class AlertHelper {
  static AlertHelper shared = AlertHelper();

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

  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: CustomColor.shared.backgroundWhiteColor,
            ),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: CustomColor.shared.backgroundBlueColor,
      elevation: 12,
    ));
  }
}
