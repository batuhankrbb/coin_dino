import 'package:auto_size_text/auto_size_text.dart';
import '../../../global/starting_files/injection_container.dart';
import '../../viewmodels/detail_screen_view_model.dart';

import 'package:flutter/material.dart';

import 'chart_option_cell.dart';
import 'chart_option_value_data.dart';

class ChartOptions extends StatefulWidget {
  ChartOptions({Key? key, required this.coinID}) : super(key: key);

  @override
  _ChartOptionsState createState() => _ChartOptionsState();

  final String coinID;
}

class _ChartOptionsState extends State<ChartOptions>
    with AutomaticKeepAliveClientMixin {
  var selectedIndex = 2;

  var detailViewModel = getit.get<DetailScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ChartOptionValue.chartValues.map(
        (value) {
          var index = ChartOptionValue.chartValues.indexOf(value);
          return Expanded(
            child: buildChartOptionCell(value, index),
          );
        },
      ).toList(),
    );
  }
  
  ChartOptionCell buildChartOptionCell(ChartOptionValue value, int index) {
    return ChartOptionCell(
      value: value,
      isSelected: index == selectedIndex,
      index: index,
      onTap: () {
        detailViewModel.getCharts(coinID: widget.coinID, days: value.value);
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
