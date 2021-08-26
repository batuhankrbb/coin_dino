import 'package:auto_size_text/auto_size_text.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class PercentageChip extends StatelessWidget {
  PercentageChip({Key? key, required this.percentage}) : super(key: key);

  final num percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.getHeight(0.002)),
      width: context.getWidth(0.13),
      height: context.getHeight(0.1),
      alignment: Alignment.center,
      decoration: buildBoxDecoration(context),
      child: AutoSizeText(
        NumberHelper.shared.giveFormattedTextByPercentage(percentage),
        minFontSize: 6,
        maxLines: 1,
        style: TextStyle(color: context.theme.hintColor, fontSize: 50),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: percentage < 0
          ? context.colorScheme.onPrimary
          : context.colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
