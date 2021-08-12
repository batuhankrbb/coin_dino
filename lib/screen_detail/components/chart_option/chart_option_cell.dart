import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/screen_detail/components/chart_option/chart_options.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'chart_option_value_data.dart';

class ChartOptionCell extends StatelessWidget {
  ChartOptionCell(
      {Key? key,
      required this.value,
      required this.isSelected,
      required this.index,
      required this.onTap})
      : super(key: key);

  final ChartOptionValue value;
  final bool isSelected;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: buildDecoration(context),
        margin: EdgeInsets.all(context.getWidth(0.01)),
        alignment: Alignment.center,
        child: buildText(context),
      ),
    );
  }

  AutoSizeText buildText(BuildContext context) {
    return AutoSizeText(
      value.name,
      style: TextStyle(
        color: isSelected
            ? context.colorScheme.onSurface
            : context.colorScheme.primary,
        fontWeight: FontWeight.w500,
        fontSize: context.getWidth(0.04),
      ),
    );
  }

  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: isSelected ? context.colorScheme.surface : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
