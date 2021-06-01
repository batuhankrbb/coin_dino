import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:flutter/material.dart';

class PercentageChip extends StatelessWidget {
  PercentageChip({Key? key, required this.percentage}) : super(key: key);

  final num percentage;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.13,
        height: screenInfo.screenSize.height * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: percentage < 0 ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(12)),
        child: AutoSizeText(
          NumberHelper.shared.giveFormattedTextByPercentage(percentage),
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    });
  }
}