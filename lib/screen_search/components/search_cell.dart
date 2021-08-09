import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import '../../features/search/domain/entity/search_coin_entity.dart';
import '../../global/components/cashed_network_image_component.dart';
import '../../global/components/custom_autosize_text.dart';
import 'percentage_chip.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
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
            height: screenInfo.screenSize.height * 0.11,
            margin: EdgeInsets.symmetric(vertical: context.getHeight(0.01)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 15,
                  child: buildCoinImage(context),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 44,
                  child: buildCoinText(context),
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 31,
                  child: buildCoinPrice(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCoinImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: CashedNetworkImageWidget(
        imageURL: searchCoinEntity.imageUrl,
        imageHeigth: context.getHeight(0.1),
      ),
    );
  }

  Container buildCoinPrice(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 10,
            child: CustomAutoSizeText(
              text: searchCoinEntity.currentPrice,
              textStyle: TextStyle(
                  color: context.colorScheme.primary,
                  fontSize: context.getWidth(0.045)),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 7,
            child: PercentageChip(
              percentage: searchCoinEntity.priceChangePercentage24h ?? 0,
            ),
          )
        ],
      ),
    );
  }

  Column buildCoinText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 5,
          child: CustomAutoSizeText(
            text: searchCoinEntity.name,
            textStyle: TextStyle(
              fontSize: context.getWidth(0.05),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 5,
          child: CustomAutoSizeText(
            text: searchCoinEntity.symbol,
            textStyle: TextStyle(
              fontSize: context.getWidth(0.03),
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }
}
