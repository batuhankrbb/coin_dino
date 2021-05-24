import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InformerWidget(
          onPageBuild: (context, screenInformation) {
            return Container(
              width: screenInformation.screenSize.width * 0.20,
              height: screenInformation.screenSize.width * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CustomColor.shared.backgroundBlueColor,
              ),
            );
          },
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: CustomColor.shared.backgroundWhiteColor,
          valueColor:
              AlwaysStoppedAnimation(CustomColor.shared.backgroundBlueColor),
        )
      ],
    );
  }
}
