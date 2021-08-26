import 'package:fl_chart/fl_chart.dart';

import '../../../features/details/domain/entity/coin_chart_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class FinanceChart extends StatelessWidget {
  const FinanceChart({Key? key, required this.data}) : super(key: key);

  final CoinChartEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: context.colorScheme.onSurface,
          child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              labelStyle: TextStyle(color: context.colorScheme.primary),
            ),
            series: buildChartSeries,
            primaryYAxis: NumericAxis(
              labelStyle: TextStyle(color: context.colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }

  List<ChartSeries> get buildChartSeries {
    return <ChartSeries>[
      LineSeries<double, DateTime>(
        dataSource: data.prices,
        xValueMapper: (value, index) {
          return data.dates[index];
        },
        yValueMapper: (value, index) {
          return data.prices[index];
        },
      ),
    ];
  }
}
