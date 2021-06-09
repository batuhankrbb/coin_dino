import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import '../../features/search/domain/entity/search_trend_entity.dart';
import '../../global/components/cashed_network_image_component.dart';
import '../../global/components/custom_autosize_text.dart';

import 'package:flutter/material.dart';

class TrendCell extends StatelessWidget {
  TrendCell({Key? key, required this.searchTrendCoinEntity}) : super(key: key);

  final SearchTrendCoinEntity searchTrendCoinEntity;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, screenInfo) {
      return Container(
        width: screenInfo.screenSize.width * 0.8,
        height: screenInfo.screenSize.height * 0.08,
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              flex: 12,
              child: buildCoinImage(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 44,
              child: buildCoinText(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 31,
              child: buildCoinPrice(),
            ),
          ],
        ),
      );
    });
  }

  Widget buildCoinImage() {
    return Container(
      child: CashedNetworkImageWidget(
        imageURL: searchTrendCoinEntity.largeImage,
        imageHeigth: 100,
      ),
    );
  }

  Container buildCoinPrice() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomAutoSizeText(
              text:
                  NumberHelper.shared.fixNum(searchTrendCoinEntity.btcPrice, 5),
              textStyle: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Column buildCoinText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: CustomAutoSizeText(
            text: searchTrendCoinEntity.name,
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 4,
          child: CustomAutoSizeText(
            text: searchTrendCoinEntity.symbol.toUpperCase(),
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
