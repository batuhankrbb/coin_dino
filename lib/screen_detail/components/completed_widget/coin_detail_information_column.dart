import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:flutter/material.dart';

import '../coin_detail_information_row.dart';

class CoinDetailInformationListWidget extends StatelessWidget {
  const CoinDetailInformationListWidget({Key? key, required this.data}) : super(key: key);

  final CoinDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "MARKET CAP RANK", price: data.marketCapRank),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "MARKET CAP", price: data.marketCap),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "TRADING VOLUME", price: data.tradingVolume),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "24H HIGH", price: data.highest24h),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "24H LOW", price: data.lowest24h),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "AVAILABLE SUPPLY", price: data.availableSuppy),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "TOTAL SUPPLY", price: data.totalSupply),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "ALL-TIME HIGH", price: data.allTimeHigh),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "SINCE ALL-TIME HIGH", price: data.sinceAllTimeHigh),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "ALL-TIME HIGH DATE", price: data.allTimeHighDate),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "ALL-TIME LOW", price: data.allTimeLow),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "SINCE ALL-TIME LOW", price: data.sinceAllTimeLow),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "ALL-TIME LOW DATE", price: data.allTimeLowDate),
        ),
      ],
    );
  }
}
