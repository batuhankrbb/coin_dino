import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/screen_detail/components/completed_widget/coin_detail_hours_information_list.dart';
import 'package:coin_dino/screen_detail/components/completed_widget/coin_detail_information_column.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../coin_chart/coin_chart.dart';
import '../coin_detail_information_row.dart';
import '../coin_details_hour_table_widget.dart';

class CoinDetailCompletedWidget extends StatefulWidget {
  CoinDetailCompletedWidget({Key? key, required this.data}) : super(key: key);

  @override
  _CoinDetailCompletedWidgetState createState() =>
      _CoinDetailCompletedWidgetState();

  final CoinDetailEntity data;
}

class _CoinDetailCompletedWidgetState extends State<CoinDetailCompletedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: SingleChildScrollView(
        key: PageStorageKey("detail_scroll"),
        child: SizedBox(
          height: context.getHeight(1.5),
          child: buildChildrenColumn(),
        ),
      ),
    );
  }

  Column buildChildrenColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: 20,
          child: buildGraph(),
        ),
        Expanded(
          flex: 1,
          child: Divider(),
        ),
        Spacer(),
        Expanded(
          flex: 4,
          child: CoinDetailHoursInformationRow(data: widget.data),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 30,
          child: CoinDetailInformationListWidget(
            data: widget.data,
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }

  Widget buildGraph() {
    return CoinChart(
      coinID: widget.data.id,
    );
  }
}
