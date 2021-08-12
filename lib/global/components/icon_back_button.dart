import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        color: context.colorScheme.primary,
        size: context.getHeight(0.03),
      ),
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
