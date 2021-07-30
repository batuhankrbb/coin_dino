import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import '../../screen_in_app_purchase/inapp_purchase_screen.dart';
import 'package:flutter/material.dart';

import '../../core/mini_services/image/image_helper.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class SettingInAppPurchaseCardWidget extends StatelessWidget {
  const SettingInAppPurchaseCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, screenInformation) {
        return GestureDetector(
          onTap: () {
            NavigationService.shared.navigateTo(
              NavigationRoute.toInAppPurchase(
                InAppPurchase(),
              ),
            );
          },
          child: Container(
            width: screenInformation.screenSize.width * 0.98,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.orangeAccent])),
            child: Row(
              children: [
                Expanded(
                    flex: 7,
                    child: ImageHelper.shared.getAssetImage(imageName: "ad")),
                Spacer(flex: 1),
                Expanded(
                  flex: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText("Remove ads",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      AutoSizeText("For a better experience.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
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
}
