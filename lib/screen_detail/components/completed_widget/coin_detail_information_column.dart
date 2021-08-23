import '../../../features/details/domain/entity/coin_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../coin_detail_information_row.dart';

class CoinDetailInformationListWidget extends StatelessWidget {
  const CoinDetailInformationListWidget({Key? key, required this.data})
      : super(key: key);

  final CoinDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_MARKET_CAP_RANK_TEXT".tr(),
              price: data.marketCapRank),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_MARKET_CAP_TEXT".tr(),
              price: data.marketCap),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_TRADING_VOLUME_TEXT".tr(),
              price: data.tradingVolume),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_24H_HIGH_TEXT".tr(),
              price: data.highest24h),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_24H_LOW_TEXT".tr(),
              price: data.lowest24h),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_AVAILABLE_SUPPLY_TEXT".tr(),
              price: data.availableSuppy),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_TOTAL_SUPPLY_TEXT".tr(),
              price: data.totalSupply),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_ALLTIME_HIGH_TEXT".tr(),
              price: data.allTimeHigh),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title:
                  "DETAIL_SCREEN.INFORMATION_ROW_SINCE_ALLTIME_HIGH_TEXT".tr(),
              price: data.sinceAllTimeHigh),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title:
                  "DETAIL_SCREEN.INFORMATION_ROW_ALL_TIME_HIGH_DATE_TEXT".tr(),
              price: data.allTimeHighDate),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title: "DETAIL_SCREEN.INFORMATION_ROW_ALLTIME_LOW_TEXT".tr(),
              price: data.allTimeLow),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title:
                  "DETAIL_SCREEN.INFORMATION_ROW_SINCE_ALLTIME_LOW_TEXT".tr(),
              price: data.sinceAllTimeLow),
        ),
        Expanded(
          child: CoinDetailInformationRowWidget(
              title:
                  "DETAIL_SCREEN.INFORMATION_ROW_ALL_TIME_LOW_DATE_TEXT".tr(),
              price: data.allTimeLowDate),
        ),
      ],
    );
  }
}
