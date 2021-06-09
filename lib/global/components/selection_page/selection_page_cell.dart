import '../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../utils/custom_colors.dart';
import 'package:flutter/material.dart';

import '../custom_autosize_text.dart';

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
  bool isVisible;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: onTap,
          child: buildContainer(screenInfo),
        ),
      );
    });
  }

  Container buildContainer(ScreenInformation screenInfo) {
    return Container(
      height: screenInfo.screenSize.height * 0.05,
      margin: EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 6),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 85,
            child: buildCustomAutoSizeText(),
          ),
          Expanded(
            flex: 15,
            child: buildIcon(),
          ),
        ],
      ),
    );
  }

  Visibility buildIcon() {
    return Visibility(
      child: Icon(Icons.check),
      visible: isSelected,
    );
  }

  CustomAutoSizeText buildCustomAutoSizeText() {
    return CustomAutoSizeText(
      text: text,
      minFontSize: 14,
      textStyle: TextStyle(
          fontSize: 16,
          color: CustomColor.shared.backgroundDarkModeColor,
          fontWeight: FontWeight.w300),
      maxLines: 1,
    );
  }
}
