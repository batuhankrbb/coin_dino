import 'package:syncfusion_flutter_charts/charts.dart';

import '../../features/details/domain/entity/coin_chart_entity.dart';
import '../../global/components/state_result_builder.dart';
import '../../global/starting_files/injection_container.dart';
import '../viewmodels/detail_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chart_options.dart';

class CoinChart extends StatefulWidget {
  CoinChart({Key? key, required this.coinID}) : super(key: key);

  @override
  _CoinChartState createState() => _CoinChartState();

  final String coinID;
}

class _CoinChartState extends State<CoinChart> {
  var detailViewModel = getit.get<DetailScreenViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 90,
            child: buildGraph(),
          ),
          Expanded(
            flex: 10,
            child: ChartOptions(
              coinID: widget.coinID,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGraph() {
    return Observer(builder: (context) {
      return StateResultBuilder<CoinChartEntity>(
        stateResult: detailViewModel.coinChartResult,
        failureWidget: (failure) {
          return Text(failure.message);
        },
        completedWidget: (data) {
          return FinanceChart(data: data);
        },
        loadingWidget: CupertinoActivityIndicator(),
      );
    });
  }
}

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
            series: <ChartSeries>[
              LineSeries<double, DateTime>(
                dataSource: data.prices,
                xValueMapper: (value, index) {
                  return data.dates[index];
                },
                yValueMapper: (value, index) {
                  return data.prices[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
