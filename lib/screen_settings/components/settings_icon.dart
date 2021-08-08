import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({Key? key, required this.iconData}) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.09,
        height: screenInfo.screenSize.width * 0.09,
        decoration: buildBoxDecoration(context),
        child: Icon(
          iconData,
          color: context.colorScheme.onSurface,
          size: context.getWidth(0.05),
        ),
      );
    });
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colorScheme.error,
        boxShadow: [
          BoxShadow(
              color: context.colorScheme.error,
              blurRadius: 8,
              offset: Offset(0, 5))
        ]);
  }
}
