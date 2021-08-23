import 'package:auto_size_text/auto_size_text.dart';
import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../screen_in_app_purchase/inapp_purchase_screen.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/mini_services/image/image_helper.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

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
            decoration: buildBoxDecoration(context),
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
                  flex: 3,
                  child: Icon(
                    Icons.chevron_right,
                    color: context.colorScheme.onSurface,
                    size: context.getWidth(0.07),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: LinearGradient(colors: [
        context.colorScheme.surface,
        context.colorScheme.secondary,
      ]),
    );
  }

  Column buildTexts(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "SETTINGS_SCREEN.IAP_CARD_TITLE".tr(),
          style: TextStyle(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: context.getWidth(0.05),
          ),
        ),
        AutoSizeText(
          "SETTINGS_SCREEN.IAP_CARD_SUBTITLE".tr(),
          style: TextStyle(
            color: context.colorScheme.onSurface,
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
        InAppPurchaseScreen(),
      ),
    );
  }
}
