import '../features/search/domain/entity/search_trend_entity.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/trend_cell.dart';
import 'viewmodels/search_screen_view_model.dart';

class TrendsScreen extends StatefulWidget {
  TrendsScreen({Key? key}) : super(key: key);

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  var searchViewModel = getit.get<SearchScreenViewModel>();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 80,
          child: buildList(),
        ),
      ],
    );
  }

  Widget buildList() {
    return Observer(builder: (context) {
      return StateResultBuilder<SearchTrendEntity>(
          stateResult: searchViewModel.searchTrendResult,
          completedWidget: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return TrendCell(
                    searchTrendCoinEntity: data.coinEntityList[index]);
              },
              itemCount: data.coinEntityList.length,
            );
          },
          failureWidget: (failure) {
            return Text("failure");
          });
    });
  }
}
