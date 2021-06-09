import 'package:auto_size_text/auto_size_text.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InAppPurchase(),
                ));
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
                      AutoSizeText("Reklamları Kaldır",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      AutoSizeText(
                          "Reklamları kaldırar bize destek olabilirsiniz. Bizde sizler için uygulamayı geliştirmek için elimizden geleni yaparız.",
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
