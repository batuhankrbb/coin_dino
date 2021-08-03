import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import '../../features/search/domain/entity/search_coin_entity.dart';
import '../../global/components/cashed_network_image_component.dart';
import '../../global/components/custom_autosize_text.dart';
import 'percentage_chip.dart';

import 'package:flutter/material.dart';

import '../search_screen_main.dart';

class SearchCell extends StatelessWidget {
  SearchCell({Key? key, required this.searchCoinEntity, required this.onTap})
      : super(key: key);

  final SearchCoinEntity searchCoinEntity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, screenInfo) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Container(
            width: screenInfo.screenSize.width * 0.8,
            height: screenInfo.screenSize.height * 0.09,
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 15,
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
          ),
        );
      },
    );
  }

  Widget buildCoinImage() {
    return Container(
      padding: EdgeInsets.all(4),
      child: CashedNetworkImageWidget(
        imageURL: searchCoinEntity.imageUrl,
        imageHeigth: 200,
      ),
    );
  }

  Container buildCoinPrice() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 10,
            child: CustomAutoSizeText(
              text:
                  NumberHelper.shared.fixNum(searchCoinEntity.currentPrice, 5),
              textStyle: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 8,
            child: PercentageChip(
              percentage: searchCoinEntity.priceChangePercentage24h ?? 0,
            ),
          )
        ],
      ),
    );
  }

  Column buildCoinText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 5,
          child: CustomAutoSizeText(
            text: searchCoinEntity.name,
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 5,
          child: CustomAutoSizeText(
            text: searchCoinEntity.symbol.toUpperCase(),
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
