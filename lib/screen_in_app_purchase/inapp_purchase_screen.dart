import 'package:auto_size_text/auto_size_text.dart';
import '../core/mini_services/image/image_helper.dart';
import '../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../global/components/app_bar_components.dart';
import '../global/extensions/style_extensions.dart';
import '../global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class InAppPurchase extends StatelessWidget {
  const InAppPurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(flex: 30, child: InappPurchaseTextWidget()),
            Spacer(flex: 1),
            Expanded(
                flex: 50,
                child: ImageHelper.shared.getAssetImage(imageName: "ad")),
            Spacer(flex: 15),
            Expanded(
              flex: 8,
              child: InAppPurchaseButton(),
            ),
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

  Widget buildRestoreButton() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: TextButton(
        onPressed: null,
        child: Text(
          "Restore Purchase",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      onTap: () {
        //TODO RESTORE PURCHASE KODU
      },
    );
  }
}

class InappPurchaseTextWidget extends StatelessWidget {
  const InappPurchaseTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: AutoSizeText(
              "We know that ads are annoying. Aren't they?",
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              "You can both remove all the ads on the app permanently and support us with 1\$",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class InAppPurchaseButton extends StatelessWidget {
  const InAppPurchaseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: context.buttonStyle(
            backgroundColor: CustomColor.shared.backgroundBlueColor),
        onPressed: () {
          //TODO REKLAM KALDIRMA KODU
        },
        child: Text("Remove Ads"),
      ),
    );
  }
}
