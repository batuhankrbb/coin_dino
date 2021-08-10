import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class HomeHeaderButton extends StatefulWidget {
  HomeHeaderButton(
      {Key? key,
      required this.text,
      this.isUpside,
      this.isDownside,
      this.onTap})
      : super(key: key);

  @override
  _HomeHeaderButtonState createState() => _HomeHeaderButtonState();

  VoidCallback? onTap;
  bool? isUpside;
  bool? isDownside;
  String text;
}

class _HomeHeaderButtonState extends State<HomeHeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primaryVariant,
      alignment: Alignment.center,
      child: AutoSizeText(
        widget.text,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: context.colorScheme.secondaryVariant,
            fontSize: context.getWidth(0.035),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
