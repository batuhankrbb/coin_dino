import 'package:auto_size_text/auto_size_text.dart';
import '../core/mini_services/image/image_helper.dart';
import '../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../global/components/app_bar_components.dart';
import '../global/extensions/style_extensions.dart';
import '../global/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'components/in_app_purchase_button.dart';
import 'components/in_app_purchase_text_widget.dart';

class InAppPurchaseScreen extends StatefulWidget {
  const InAppPurchaseScreen({Key? key}) : super(key: key);

  @override
  _InAppPurchaseScreenState createState() => _InAppPurchaseScreenState();
}

class _InAppPurchaseScreenState extends State<InAppPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Purchase"),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
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
          "Restore Purchase",
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Colors.blue, fontSize: context.getWidth(0.05)),
        ),
      ),
      onTap: () {
        //TODO RESTORE PURCHASE KODU
      },
    );
  }
}
