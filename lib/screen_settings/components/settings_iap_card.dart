import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import '../../screen_in_app_purchase/inapp_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../../core/mini_services/image/image_helper.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class SettingInAppPurchaseCardWidget extends StatelessWidget {
  const SettingInAppPurchaseCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, screenInformation) {
        return GestureDetector(
          onTap: navigateToInAppScreen,
          child: Container(
            width: screenInformation.screenSize.width * 0.98,
            padding: EdgeInsets.all(context.getWidth(0.02)),
            decoration: buildBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 7,
                    child: ImageHelper.shared.getAssetImage(imageName: "ad")),
                Spacer(flex: 1),
                Expanded(
                  flex: 30,
                  child: buildTexts(context),
                ),
                Spacer(flex: 1),
                Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent]),
    );
  }

  Column buildTexts(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Remove ads",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: context.getWidth(0.05),
          ),
        ),
        AutoSizeText(
          "For a better experience.",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: context.getWidth(0.03),
          ),
        ),
      ],
    );
  }

  void navigateToInAppScreen() {
    NavigationService.shared.navigateTo(
      NavigationRoute.toInAppPurchase(
        InAppPurchase(),
      ),
    );
  }
}
