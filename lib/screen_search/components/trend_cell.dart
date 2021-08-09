import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import '../../features/search/domain/entity/search_trend_entity.dart';
import '../../global/components/cashed_network_image_component.dart';
import '../../global/components/custom_autosize_text.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TrendCell extends StatelessWidget {
  TrendCell(
      {Key? key, required this.searchTrendCoinEntity, required this.onTap})
      : super(key: key);

  final SearchTrendCoinEntity searchTrendCoinEntity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InformerWidget(
        onPageBuild: (context, screenInfo) {
          return Container(
            width: screenInfo.screenSize.width * 0.8,
            height: screenInfo.screenSize.height * 0.1,
            margin: EdgeInsets.symmetric(vertical: context.getHeight(0.01)),
            child: Row(
              children: [
                Expanded(
                  flex: 12,
                  child: buildCoinImage(context),
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 44,
                  child: buildCoinTexts(context),
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
          );
        },
      ),
    );
  }

  Widget buildCoinImage(BuildContext context) {
    return Container(
      child: CashedNetworkImageWidget(
        imageURL: searchTrendCoinEntity.largeImage,
        imageHeigth: context.getHeight(0.1),
      ),
    );
  }

  Widget buildCoinPrice(BuildContext context) {
    return Center(
      child: CustomAutoSizeText(
        text: searchTrendCoinEntity.btcPrice,
        textStyle:
            TextStyle(color: Colors.black, fontSize: context.getWidth(0.05)),
        maxLines: 1,
      ),
    );
  }

  Column buildCoinTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 6,
          child: CustomAutoSizeText(
            text: searchTrendCoinEntity.name,
            textStyle: TextStyle(
                fontSize: context.getWidth(0.05), fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 12,
          child: CustomAutoSizeText(
            text: searchTrendCoinEntity.symbol,
            textStyle: TextStyle(
                fontSize: context.getWidth(0.04), fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
