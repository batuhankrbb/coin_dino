import 'package:coin_dino/features/details/domain/entity/coin_chart_entity.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_coin_detail/components/chart_options.dart';
import 'package:coin_dino/screen_coin_detail/viewmodels/detail_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          return Text("successfullll ${data.prices.length}");
        },
      );
    });
  }
}
