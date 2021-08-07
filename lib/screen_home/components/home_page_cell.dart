import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class HomePageCell extends StatelessWidget {
  HomePageCell({Key? key, required this.data}) : super(key: key);

  MarketCoinEntity data;
  var homeScreenViewModel = getit.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[200],
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        children: [
          Spacer(),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: AutoSizeText(
                data.marketCapRank,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                minFontSize: 6,
                textAlign: TextAlign.center,
              ),
            ),
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
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: AutoSizeText(
                "\$${data.currentPrice}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                minFontSize: 6,
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: AutoSizeText(
                "${getPriceChange().toStringAsFixed(2)}%",
                style: TextStyle(
                  color: getPriceChange() < 0 ? Colors.red : Colors.green,
                  fontSize: 16,
                ),
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 35,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: AutoSizeText(
                "\$${data.marketCap}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                minFontSize: 6,
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildCoinNameAndImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: CashedNetworkImageWidget(
                imageURL: data.imageUrl,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: AutoSizeText(
                data.symbol.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  num getPriceChange() {
    switch (homeScreenViewModel.marketDate) {
      case MarketDate.hour1:
        return data.priceChangePercentage1h ?? 0.0;

      case MarketDate.hour24:
        return data.priceChangePercentage24h ?? 0.0;

      case MarketDate.day7:
        return data.priceChangePercentage7d ?? 0.0;

      case MarketDate.day30:
        return data.priceChangePercentage30d ?? 0.0;
    }
  }
}
