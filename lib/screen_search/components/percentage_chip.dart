import 'package:auto_size_text/auto_size_text.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class PercentageChip extends StatelessWidget {
  PercentageChip({Key? key, required this.percentage}) : super(key: key);

  final num percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.getWidth(0.009)),
      width: MediaQuery.of(context).size.width * 0.13,
      height: MediaQuery.of(context).size.height * 0.1,
      alignment: Alignment.center,
      decoration: buildBoxDecoration(),
      child: AutoSizeText(
        NumberHelper.shared.giveFormattedTextByPercentage(percentage),
        maxLines: 1,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: percentage < 0 ? Colors.red : Colors.green,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
