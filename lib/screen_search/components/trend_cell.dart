import 'package:auto_size_text/auto_size_text.dart';

import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../core/utils/number_helper.dart';
import '../../features/search/domain/entity/search_trend_entity.dart';
import '../../global/components/cached_network_image.dart';

import '../../core/extensions/context_extensions.dart';
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
            height: screenInfo.screenSize.height * 0.06,
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
      child: CachedNetworkImageWidget(
        imageURL: searchTrendCoinEntity.largeImage,
        imageHeigth: context.getHeight(0.04),
        imageWidth: context.getHeight(0.04),
      ),
    );
  }

  Widget buildCoinPrice(BuildContext context) {
    return Center(
      child: AutoSizeText(
        searchTrendCoinEntity.btcPrice,
        minFontSize: 14,
        style: TextStyle(
          color: context.colorScheme.primary,
          fontSize: context.getWidth(0.04),
        ),
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
          flex: 10,
          child: AutoSizeText(
            searchTrendCoinEntity.name,
            style: TextStyle(
              fontSize: context.getWidth(0.04),
              fontWeight: FontWeight.bold,
               color: context.colorScheme.primary,
            ),
            minFontSize: 10,
          ),
        ),
        Spacer(),
        Flexible(
          flex: 12,
          child: AutoSizeText(
            searchTrendCoinEntity.symbol,
            style: TextStyle(
              fontSize: context.getWidth(0.025),
              fontWeight: FontWeight.w300,
               color: context.colorScheme.primary,
            ),
            minFontSize: 12,
          ),
        )
      ],
    );
  }
}
