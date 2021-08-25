import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/notification/notification_helper.dart';
import '../core/mini_services/image/image_helper.dart';
import '../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../global/components/app_bar_components.dart';
import '../global/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';
import 'components/in_app_purchase_button.dart';
import 'components/in_app_purchase_text_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class InAppPurchaseScreen extends StatefulWidget {
  const InAppPurchaseScreen({Key? key}) : super(key: key);

  @override
  _InAppPurchaseScreenState createState() => _InAppPurchaseScreenState();
}

class _InAppPurchaseScreenState extends State<InAppPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: "INAPP_SCREEN.APP_BAR_TITLE".tr(),
          showBackButton: true),
      backgroundColor: context.colorScheme.onSurface,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Divider(),
            ),
            Spacer(),
            Expanded(
              flex: 30,
              child: InappPurchaseTextWidget(),
            ),
            Spacer(flex: 4),
            Expanded(
              flex: 40,
              child: ImageHelper.shared.getAssetImage(imageName: "ad"),
            ),
            Spacer(flex: 8),
            Expanded(
              flex: 8,
              child: buildPurchaseButton(),
            ),
            Spacer(),
            Expanded(
              flex: 8,
              child: buildRestoreButton(),
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  Widget buildPurchaseButton() {
    return InAppPurchaseButton(
      onTap: () {
        
        //TODO REKLAM KALDIRMA KODU
      },
    );
  }

  Widget buildRestoreButton() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: TextButton(
        onPressed: null,
        child: AutoSizeText(
          "INAPP_SCREEN.RESTORE_BUTTON_TEXT".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: context.theme.buttonColor,
              fontSize: context.getWidth(0.05)),
        ),
      ),
      onTap: () {
        //TODO RESTORE PURCHASE KODU
      },
    );
  }
}
