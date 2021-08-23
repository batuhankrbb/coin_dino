import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../features/details/domain/entity/coin_detail_entity.dart';
import '../coin_details_hour_table_widget.dart';

class CoinDetailHoursInformationRow extends StatelessWidget {
  const CoinDetailHoursInformationRow({Key? key, required this.data}) : super(key: key);

  final CoinDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
            tableTitle: "DETAIL_SCREEN_HOURS_TABLE_24H_TEXT".tr(),
            tablePrice: data.priceChange24hTable,
            isPricePositive: data.ispriceChange24hPositive,
          ),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
            tableTitle: "DETAIL_SCREEN_HOURS_TABLE_7D_TEXT".tr(),
            tablePrice: data.priceChange7dTable,
            isPricePositive: data.ispriceChange7dPositive,
          ),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "DETAIL_SCREEN_HOURS_TABLE_14D_TEXT".tr(),
              tablePrice: data.priceChange14dTable,
              isPricePositive: data.ispriceChange14dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "DETAIL_SCREEN_HOURS_TABLE_30D_TEXT".tr(),
              tablePrice: data.priceChange30dTable,
              isPricePositive: data.ispriceChange30dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "DETAIL_SCREEN_HOURS_TABLE_60D_TEXT".tr(),
              tablePrice: data.priceChange60dTable,
              isPricePositive: data.ispriceChange60dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "DETAIL_SCREEN_HOURS_TABLE_1Y_TEXT".tr(),
              tablePrice: data.priceChange1yTable,
              isPricePositive: data.ispriceChange1yPositive),
        ),
      ],
    );
  }
}
