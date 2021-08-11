import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/components/home_table/home_cell_custom_text.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class HomePageCell extends StatefulWidget {
  HomePageCell(
      {Key? key,
      required this.data,
      required this.itemFlexList,
      required this.spacerFlexList})
      : super(key: key);

  final MarketCoinEntity data;

  final List<int> itemFlexList;
  final List<int> spacerFlexList;

  @override
  _HomePageCellState createState() => _HomePageCellState();
}

class _HomePageCellState extends State<HomePageCell> {
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: context.colorScheme.onSurface,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: buildMarketCapRank(),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: buildCoinNameAndImage(),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 28,
            child: buildCurrentPrice(),
          ),
          Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 15,
            child: buildPriceChange(),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 32,
            child: buildMarketCap(),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget buildMarketCap() {
    return HomeCellCustomText(
      text: widget.data.marketCap,
      fontSize: context.getWidth(0.04),
      textColor: Colors.black,
      minFontSize: 8,
      padding: 4,
    );
  }

  Widget buildPriceChange() {
    return HomeCellCustomText(
      text: homeScreenViewModel.getPriceChange(widget.data),
      fontSize: context.getWidth(0.035),
      minFontSize: 6,
      textColor: homeScreenViewModel.getPriceChangePositivity(widget.data)
          ? Colors.green
          : Colors.red,
    );
  }

  Widget buildCurrentPrice() {
    return HomeCellCustomText(
      text: widget.data.currentPrice,
      fontSize: context.getWidth(0.035),
      textColor: Colors.black,
      minFontSize: 6,
    );
  }

  Widget buildMarketCapRank() {
    return HomeCellCustomText(
      text: widget.data.marketCapRank,
      fontSize: context.getWidth(0.04),
      textColor: Colors.black,
      minFontSize: 6,
      textAlign: TextAlign.center,
      padding: 2,
    );
  }

  Widget buildCoinNameAndImage() {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              alignment: Alignment.center,
              child: CashedNetworkImageWidget(
                imageURL: widget.data.imageUrl,
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: HomeCellCustomText(
              text: widget.data.symbol,
              fontSize: context.getWidth(0.5),
              textColor: Colors.black,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}