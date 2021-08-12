import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../utils/custom_colors.dart';
import 'package:flutter/material.dart';

class SelectionPageCell extends StatelessWidget {
  SelectionPageCell(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onTap,
      required this.isVisible})
      : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: onTap,
          child: buildContainer(screenInfo, context),
        ),
      );
    });
  }

  Container buildContainer(ScreenInformation screenInfo, BuildContext context) {
    return Container(
      height: screenInfo.screenSize.height * 0.05,
      margin: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 6),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 85,
            child: buildCustomAutoSizeText(context),
          ),
          Expanded(
            flex: 15,
            child: buildIcon(context),
          ),
        ],
      ),
    );
  }

  Visibility buildIcon(BuildContext context) {
    return Visibility(
      child: Icon(
        Icons.check,
        color: context.colorScheme.primary,
        size: context.getHeight(0.035),
      ),
      visible: isSelected,
    );
  }

  Widget buildCustomAutoSizeText(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 12,
      style: TextStyle(
        fontSize: context.getHeight(0.024),
        color: context.colorScheme.primary,
        fontWeight: FontWeight.w300,
      ),
      maxLines: 1,
    );
  }
}
