import 'package:flutter/material.dart';

import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class SettingsIcon extends StatelessWidget {
  SettingsIcon({Key? key, required this.iconData}) : super(key: key);

  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.09,
        height: screenInfo.screenSize.width * 0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.pink[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.pink[300]!, blurRadius: 8, offset: Offset(0, 5))
            ]),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
      );
    });
  }
}