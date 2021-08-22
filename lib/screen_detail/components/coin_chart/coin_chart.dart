import 'package:auto_size_text/auto_size_text.dart';
import '../../../global/components/failure_widget.dart';
import '../../../global/components/loading_screen.dart';
import '../chart_option/chart_option_value_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../features/details/domain/entity/coin_chart_entity.dart';
import '../../../global/components/state_result_builder.dart';
import '../../../global/starting_files/injection_container.dart';
import '../../viewmodels/detail_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../chart_option/chart_options.dart';
import 'finance_chart.dart';

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
            flex: 92,
            child: buildGraph(),
          ),
          Expanded(
            flex: 9,
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
          return FailureWidget(
              explanation:
                  "Something went wrong while getting chart. Give it an another shot.",
              onTryAgain: () {
                detailViewModel.getCharts(coinID: widget.coinID, days: "7");
              });
        },
        completedWidget: (data) {
          return FinanceChart(data: data);
        },
        loadingWidget: LoadingScreen(isSmallLoading: true,),
      );
    });
  }
}
