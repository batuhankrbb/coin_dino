import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/global/extensions/style_extensions.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class InAppPurchaseButton extends StatelessWidget {
  const InAppPurchaseButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: context.buttonStyle(
            backgroundColor: Colors.blue,
          ),
          onPressed: null,
          child: buildText(context),
        ),
      ),
    );
  }

  AutoSizeText buildText(BuildContext context) {
    return AutoSizeText(
          "Remove Ads",
          style: TextStyle(
            color: Colors.white,
            fontSize: context.getWidth(0.06),
          ),
        );
  }
}
