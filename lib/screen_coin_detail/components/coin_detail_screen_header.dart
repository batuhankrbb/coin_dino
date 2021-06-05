import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/mini_services/share/share_service.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CoinnDetailScreenHeaderWidget extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinPrice;
  CoinnDetailScreenHeaderWidget(
      {Key? key,
      required this.coinImage,
      required this.coinName,
      required this.coinPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 30,
            child: CashedNetworkImageWidget(
              imageWidth: 100,
              imageHeigth: 100,
              imageURL: coinImage,
            )),
        Expanded(
          flex: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildTitleAndChange(),
              ),
              Expanded(
                child: CustomAutoSizeText(
                  text: coinPrice,
                  textStyle: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 30,
            child: IconButton(
                icon: Icon(Icons.ios_share),
                onPressed: () {
                  ShareService.shared.share(text: "bitcoin is good");
                })),
      ],
    );
  }

  Row buildTitleAndChange() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 8,
          child: AutoSizeText(
            "Bitcoin",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            maxFontSize: 30,
            minFontSize: 12,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
