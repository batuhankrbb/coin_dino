import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/error_handling/custom_failure.dart';
import '../../features/market/domain/entities/market_coin_entity.dart';
import '../../global/components/cashed_network_image_component.dart';
import '../../global/components/state_result_builder.dart';
import '../../global/starting_files/injection_container.dart';
import 'wiew_model/cyrpyo_currency_viewmodel.dart';

class CyrptoCurrencyScreen extends StatefulWidget {
  CyrptoCurrencyScreen({Key? key}) : super(key: key);

  @override
  _CyrptoCurrencyScreenState createState() => _CyrptoCurrencyScreenState();
}

class _CyrptoCurrencyScreenState extends State<CyrptoCurrencyScreen> {
  late CyrptoCurrencyViewModel cyrptoCurrencyViewModel;
  @override
  void initState() {
    cyrptoCurrencyViewModel = getit.get<CyrptoCurrencyViewModel>();
    cyrptoCurrencyViewModel.getCyrptoCurrency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return StateResultBuilder(
          stateResult: cyrptoCurrencyViewModel.stateResult,
          completedWidget: cyrptoCurrencyDataTableMethod,
          failureWidget: failure,
        );
      },
    );
  }

  Widget cyrptoCurrencyDataTableMethod(List<MarketCoinEntity> marketCoinList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 8,
          columns:
              dataTableColumnMethod(cyrptoCurrencyViewModel.dataColumnArray),
          rows: dataTableRowMethod(marketCoinList),
        ),
      ),
    );
  }

  List<DataRow> dataTableRowMethod(List<MarketCoinEntity> dataRow) {
    return dataRow.map((e) {
      return DataRow(cells: [
        DataCell(Text(e.marketCapRank.toString())),
        DataCell(CashedNetworkImageWidget(imageURL: e.imageUrl)),
        DataCell(SizedBox(width: 100, child: Text(e.name.toString()))),
        DataCell(Text(e.currentPrice.toString())),
        DataCell(Text(e.priceChangePercentage24h.toString())),
        DataCell(Text(e.marketCap.toString())),
      ]);
    }).toList();
  }

  List<DataColumn> dataTableColumnMethod(List<String> column) {
    return column
        .map(
          (e) => DataColumn(
            tooltip: e,
            label: Text(
              e,
              textAlign: TextAlign.center,
            ),
          ),
        )
        .toList();
  }

  Widget failure(CustomFailure message) {
    return Text(message.message);
  }
}
