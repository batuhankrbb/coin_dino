import 'package:flutter/material.dart';

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
            tableTitle: "24H",
            tablePrice: data.priceChange24hTable,
            isPricePositive: data.ispriceChange24hPositive,
          ),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
            tableTitle: "7D",
            tablePrice: data.priceChange7dTable,
            isPricePositive: data.ispriceChange7dPositive,
          ),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "14D",
              tablePrice: data.priceChange14dTable,
              isPricePositive: data.ispriceChange14dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "30D",
              tablePrice: data.priceChange30dTable,
              isPricePositive: data.ispriceChange30dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "60D",
              tablePrice: data.priceChange60dTable,
              isPricePositive: data.ispriceChange60dPositive),
        ),
        Expanded(
          flex: 1,
          child: CoinDetailHoursTableWidget(
              tableTitle: "1Y",
              tablePrice: data.priceChange1yTable,
              isPricePositive: data.ispriceChange1yPositive),
        ),
      ],
    );
  }
}
