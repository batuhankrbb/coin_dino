import '../../../features/details/domain/entity/coin_chart_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FinanceChart extends StatelessWidget {
  const FinanceChart({Key? key, required this.data}) : super(key: key);

  final CoinChartEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            series: buildChartSeries,
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
