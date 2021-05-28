import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:flutter/material.dart';

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
                  color: Colors.pink[300]!,
                  blurRadius: 10,
                  offset: Offset(0, 6))
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
