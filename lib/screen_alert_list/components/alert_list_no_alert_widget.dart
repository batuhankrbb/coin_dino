import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class AlertListNoAlertWidget extends StatelessWidget {
  const AlertListNoAlertWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "Oh! You have no alert :(",
            maxLines: 1,
            style: TextStyle(
                fontSize: context.getWidth(0.06), fontWeight: FontWeight.w500),
          ),
          AutoSizeText(
            "You can add alert from the plus icon",
            maxLines: 2,
            style: TextStyle(fontSize: context.getWidth(0.03)),
          ),
        ],
      ),
    );
  }
}
