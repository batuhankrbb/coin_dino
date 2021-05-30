import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/mini_services/image/image_helper.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/extensions/style_extensions.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
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
            Expanded(flex: 8, child: InAppPurchaseButton()),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}

class InappPurchaseTextWidget extends StatelessWidget {
  const InappPurchaseTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText(
        "Uygulama içerisindeki reklamlardan rahatsız olduğunuzun farkındayız."
        "Sizler için reklam kaldırma özelliğini sunuyoruz. Bu seçenek ile uygulama içersind ki tüm reklamlar kalkacaktır."
        "Sadece bir kere ödeme yaparak bu özelliği kullanabilirsiniz. Kesinlikle aylık bir ödeme değildir ve kendi kendine yenilenmez.",
        maxFontSize: 25,
        minFontSize: 14,
        maxLines: 7,
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
    );
  }
}

class InAppPurchaseButton extends StatelessWidget {
  const InAppPurchaseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, screenInformation) {
        return SizedBox(
            width: screenInformation.screenSize.width,
            child: ElevatedButton(
              style: context.buttonStyle(
                  backgroundColor: CustomColor.shared.backgroundBlueColor),
              onPressed: () {},
              child: Text("Reklamları Kaldır - 8TL"),
            ));
      },
    );
  }
}
